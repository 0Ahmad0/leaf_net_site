import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leaf_net_app/core/dialogs/loading_dialog.dart';
import 'package:leaf_net_app/features/auth/screens/reset_password_screen.dart';

import '../../../core/data/datasource/configuration/locator.dart';
import '../../../core/domain/error_handler/network_exceptions.dart';
import '../../../core/helper/response_helper.dart';
import '../domain/repositories/auth_repository.dart';

class OtpController extends GetxController{
  final formKey = GlobalKey<FormState>();
  final email=Get.arguments['email'];
  List<TextEditingController> otpControllers = List.generate(6, (index) => TextEditingController());


  late AuthRepository _repository;
  Map<String,dynamic>? result;
  @override
  void onInit() {
    _repository= locator<AuthRepository>();
    super.onInit();
  }
  void verifyOtp(BuildContext context,) {
    String otp = otpControllers.map((controller) => controller.text).join();
    if (otp.length == 6) {
      print("Entered OTP: $otp");
      verifyPasswordCode(context);
    } else {
      Get.snackbar("Error", "Invalid OTP. Please enter all 6 digits.",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
  @override
  void onClose() {

    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.onClose();
  }



  Future<void> verifyPasswordCode(BuildContext context,) async {


    LoadingDialog.show(context);

    final response = await _repository.verifyOtp(email:email,code:getOtpText());
    response.when(
      success: (data) async {
        result = data.result;
        LoadingDialog.hide(context);
        ResponseHelper.onSuccess(context,message: data.message);

        Get.to(() => ResetPasswordScreen(),
            arguments: {'email':email,'tempToken':result?['temp_token']},
            transition:
            Transition.rightToLeft);
      },
      failure: (networkException) {
        LoadingDialog.hide(context);
        ResponseHelper.onFailure(context,message: NetworkExceptions.getErrorMessage(networkException));

      },
    );
  }
  String getOtpText() {
    return otpControllers.map((controller) => controller.text).join();
  }
}
