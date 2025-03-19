import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leaf_net_app/core/assets_manager.dart';

import '../../../core/data/datasource/configuration/locator.dart';
import '../../../core/dialogs/loading_dialog.dart';
import '../../../core/domain/error_handler/network_exceptions.dart';
import '../../../core/helper/response_helper.dart';
import '../../../core/strings_manager.dart';
import '../domain/repositories/diagnose_repository.dart';

class DiagnoseController extends GetxController {
  final ImagePicker picker = ImagePicker();
  File? userImage;
  XFile? image;

  late DiagnoseRepository _repository;
  Map<String, dynamic>? result;

  @override
  void onInit() {
    _repository = locator<DiagnoseRepository>();
    super.onInit();
  }

  Future pickPhoto(BuildContext context, {required ImageSource source}) async {
    final result = await picker.pickImage(source: source);
    if (result != null) {
      userImage = File(result.path);
      image = result;
      update();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(StringsManager.pleaseSelectPhotoText),
        ),
      );
    }
  }

  Future<void> diagnose(BuildContext context) async {
    if(image==null){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(StringsManager.pleaseSelectPhotoText),
        ),
      );
      return;
    }
    LoadingDialog.show(
      context,
      image: AssetsManager.loadingScanPlantIMG,
    );

    final response = await _repository.diagnose(image!);
    response.when(
      success: (data) async {
        result = await data.result;
        update();
        LoadingDialog.hide(context);
        ResponseHelper.onSuccess(context, message: data.message);
      },
      failure: (networkException) async {
        LoadingDialog.hide(context);
        ResponseHelper.onFailure(context,
            message: NetworkExceptions.getErrorMessage(networkException));
      },
    );
  }

  deletePhoto() {
    if (userImage != null) {
      userImage = null;
      image = null;
      update();
    }
  }
}
