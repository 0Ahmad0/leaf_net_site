import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/strings_manager.dart';

class DiagnoseController extends GetxController {
  final ImagePicker picker = ImagePicker();
  File? userImage;

  Future pickPhoto(BuildContext context, {required ImageSource source}) async {
    final result = await picker.pickImage(source: source);
    if (result != null) {
      userImage = File(result.path);
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
      update();
    }
  }
}
