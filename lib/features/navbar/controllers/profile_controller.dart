import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leaf_net_app/core/strings_manager.dart';

class ProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();

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

  @override
  void onClose() {
    nameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
