import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leaf_net_app/core/strings_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:leaf_net_app/features/navbar/screens/home_screen.dart';
import '../../../core/data/datasource/configuration/locator.dart';
import '../../../core/data/models/user.dart';
import '../../../core/dialogs/loading_dialog.dart';
import '../../../core/domain/error_handler/network_exceptions.dart';
import '../../../core/helper/response_helper.dart';
import '../../auth/domain/repositories/auth_repository.dart';
import '../../../../core/data/datasource/configuration/locator.dart';
import '../../auth/screens/login_screen.dart';
import '../screens/navbar_screen.dart';
class ProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
   late AuthRepository _repository;
  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();

  Future<void> _saveChanges(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          StringsManager.profileUpdateSuccessFullText,
        ),
      ),
    );
  }

  final ImagePicker picker = ImagePicker();
  File? userImage;
  XFile? image;

  Future pickPhoto(BuildContext context, {required ImageSource source}) async {
    final result = await picker.pickImage(source: source);
    if (result != null) {
      userImage = File(result.path);
      image=result;
      update();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(StringsManager.pleaseSelectPhotoText),
        ),
      );
    }
  }

  deletePhoto() {
    if (userImage != null) {
      userImage = null;
      image=null;
      update();
    }
  }

  @override
  void onInit() {
    _repository=locator<AuthRepository>();
    nameController.text=user?.completeName??'';
    emailController.text=user?.email??'';
    userNameController.text=user?.userName??'';
    super.onInit();
  }
  @override
  void onClose() {
    nameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    super.onClose();
  }



  UserModel? user;

  String? emailOtp;
  String? codeOtp;

  void updateUser(UserModel userModel){
    user=userModel;
    nameController.text=user?.completeName??'';
    emailController.text=user?.email??'';
    userNameController.text=user?.userName??'';
    update();

  }

  Future<bool?> getProfile(
      BuildContext context,{
        bool isSplash=true
      }
      ) async {

    final response = await _repository.getProfile();

    bool isGetProfile=false;
    await response.when(
      success: (data) async {


        user = data.result;
        updateUser(user!);

        isGetProfile= true;

        if(isSplash)
          Get.offAll(
                  () => NavbarScreen(),
              transition: Transition.topLevel
          );
      },
      failure: (networkException) async {


        // ResponseHelper.onNetworkFailure(context,networkException:(networkException));

        if(isSplash)
          Get.offAll(
                  () => LoginScreen(),
              transition: Transition.fadeIn
          );
      },
    );
    return isGetProfile;
  }


  Future<void> updateProfile(BuildContext context) async {
    LoadingDialog.show(context);


    final updatedUser = user?.copyWith(
      firstName: nameController.text,
      lastName: "",
      email: emailController.text,
      userName: userNameController.text
    );

    final response = await _repository.updateProfile( updatedUser!,userImage:image);
    response.when(
      success: (data) async {
        // user = await data.result;
        user = await updatedUser;
        updateUser(await data.result);

        LoadingDialog.hide(context);
        ResponseHelper.onSuccess(context,message: data.message);




      },
      failure: (networkException) async {
        LoadingDialog.hide(context);
        ResponseHelper.onFailure(context,message: NetworkExceptions.getErrorMessage(networkException));
      },
    );
  }





}
