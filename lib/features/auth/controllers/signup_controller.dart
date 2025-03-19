import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/data/datasource/configuration/locator.dart';
import '../../../core/data/models/user.dart';
import '../../../core/dialogs/loading_dialog.dart';
import '../../../core/domain/error_handler/network_exceptions.dart';
import '../../../core/helper/response_helper.dart';
import '../../navbar/controllers/profile_controller.dart';
import '../domain/repositories/auth_repository.dart';
import '../screens/account_verification_screen.dart';
import '../screens/login_screen.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  late AuthRepository _repository;
  Map<String, dynamic>? result;

  @override
  void onInit() {
    _repository = locator<AuthRepository>();
    super.onInit();
  }

  Future<void> register(BuildContext context) async {
    LoadingDialog.show(context);

    final response = await _repository.register(
      emailController.text,
      userNameController.text,
      passwordController.text,
      firstName: firstNameController.text,  // ✅ إرسال First Name
      lastName: lastNameController.text,    // ✅ إرسال Last Name
    );

    response.when(
      success: (data) async {
        Get.put(ProfileController()).user = data.result;

        ResponseHelper.onSuccess(context, message: data.message);
        await Future.delayed(Duration(seconds: 2));
        LoadingDialog.hide(context);

        Get.offAll(
              () => AccountVerificationScreen(),
          arguments: {"email": emailController.text},
          transition: Transition.topLevel,
        );
      },
      failure: (networkException) {
        LoadingDialog.hide(context);
        ResponseHelper.onFailure(
          context,
          message: NetworkExceptions.getErrorMessage(networkException),
        );
      },
    );
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
