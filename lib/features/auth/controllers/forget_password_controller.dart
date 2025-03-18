import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leaf_net_app/core/dialogs/loading_dialog.dart';

import '../../../core/data/datasource/configuration/locator.dart';
import '../../../core/domain/error_handler/network_exceptions.dart';
import '../../../core/helper/response_helper.dart';
import '../domain/repositories/auth_repository.dart';
import '../screens/otp_verification_screen.dart';

class ForgetPasswordController extends GetxController{
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();


  late AuthRepository _repository;
  Map<String,dynamic>? result;
  @override
  void onInit() {
    _repository= locator<AuthRepository>();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();

    super.onClose();
  }


  Future<void> requestPasswordReset(BuildContext context) async {

    LoadingDialog.show(context);

    final response = await _repository.requestPasswordReset(emailController.text);
    response.when(
      success: (data) async {
        result = data.result;
        LoadingDialog.hide(context);

        ResponseHelper.onSuccess(context,message: data.message);
        Get.to(() => OtpVerificationScreen(),
            arguments: {'email':emailController.text},
            transition:
            Transition.rightToLeft);
      },
      failure: (networkException) {
        LoadingDialog.hide(context);
        ResponseHelper.onFailure(context,message: NetworkExceptions.getErrorMessage(networkException));

      },
    );
  }
//   Future<void> resendResetPasswordCode(BuildContext context,
//       {String? email}) async {
//     // emit(const ChangePasswordState.loading(),);
//
//     ConstantsWidgets.showLoading();
//
//     final response = await _repository.resendResetPasswordCode(email);
//     response.when(
//       success: (data) async {
//         result = data.result;
//         ResponseHelper.onSuccess(context,message: data.message);
//         ConstantsWidgets.closeDialog();
//         Navigator.of(context, rootNavigator: true).pop(true);
//         await Future.delayed(Duration(seconds: 2));
//       },
//       failure: (networkException) {
//         ConstantsWidgets.closeDialog();
//         ResponseHelper.onFailure(context,message: NetworkExceptions.getErrorMessage(networkException));
//
//       },
//     );
//   }

}
