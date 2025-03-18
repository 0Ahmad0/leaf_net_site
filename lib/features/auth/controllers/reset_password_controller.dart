import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/data/datasource/configuration/locator.dart';
import '../../../core/dialogs/loading_dialog.dart';
import '../../../core/domain/error_handler/network_exceptions.dart';
import '../../../core/helper/response_helper.dart';
import '../../splash/splash_screen.dart';
import '../domain/repositories/auth_repository.dart';
import '../screens/login_screen.dart';

class ResetPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final tempToken=Get.arguments['tempToken'];
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  late AuthRepository _repository;
  Map<String,dynamic>? result;
  @override
  void onInit() {
    _repository= locator<AuthRepository>();
    super.onInit();
  }

  Future<void> resetPassword(BuildContext context,) async {
    if (formKey.currentState!.validate()) {
      LoadingDialog.show(context);

      final response = await _repository.resetPassword(tempToken: tempToken,newPassword: newPasswordController.text);
      response.when(
        success: (data) async {
          result = data.result;
          LoadingDialog.hide(context);
          ResponseHelper.onSuccess(context,message: data.message);
          Get.offAll(() => SplashScreen(),
              transition: Transition.upToDown);

        },
        failure: (networkException) {
          LoadingDialog.hide(context);
          ResponseHelper.onFailure(context,message: NetworkExceptions.getErrorMessage(networkException));

        },
      );
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != newPasswordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  @override
  void onClose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
