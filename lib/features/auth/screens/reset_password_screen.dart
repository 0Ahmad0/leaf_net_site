import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leaf_net_app/core/assets_manager.dart';
import 'package:leaf_net_app/core/color_manager.dart';
import 'package:leaf_net_app/core/extension/space_ext.dart';
import 'package:leaf_net_app/core/strings_manager.dart';
import 'package:leaf_net_app/features/auth/controllers/reset_password_controller.dart';
import 'package:leaf_net_app/features/auth/widgets/app_bar_widget.dart';
import 'package:leaf_net_app/features/widgets/app_button_widget.dart';
import 'package:leaf_net_app/features/widgets/app_textfield_widget.dart';

import '../../../core/helper/validator/validator_helper.dart';

class ResetPasswordScreen extends GetView<ResetPasswordController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ResetPasswordController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: Get.height * .9,
                  ),
                  child: Image.asset(
                    AssetsManager.backLoginIMG,
                    color: ColorManager.primaryColor.withOpacity(.05),
                  ),
                ),
                Column(
                  children: [
                    AppBarWidget(),
                    Image.asset(
                      AssetsManager.logoIMG,
                      width: 200,
                      height: 200,
                    ),
                    20.h.height,
                    Text(
                      StringsManager.resetPasswordText,
                      style: TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 50.sp,
                        color: ColorManager.primaryColor,
                      ),
                    ),
                    10.h.height,
                    Text(
                      StringsManager.enterNewPasswordText,
                      style: TextStyle(color: ColorManager.primaryColor),
                    ),
                    80.h.height,
                    Form(
                      key: controller.formKey,
                      child: SizedBox(
                        width: 500.w,
                        child: Column(
                          children: [



                            AppTextField(
                              controller: controller.newPasswordController,
                              suffixIcon: true,
                              obscureText: true,
                              iconData: Icons.lock_open,
                              hintText: StringsManager.passwordText,
                              validator: (value) {
                                return FieldValidator([
                                  PasswordValidator(),
                                ]).validate(value ?? '');
                              },
                            ),
                            40.h.height,
                            AppTextField(
                              controller:
                              controller.confirmPasswordController,
                              suffixIcon: true,
                              obscureText: true,
                              iconData: Icons.lock_open,
                              hintText: StringsManager.passwordText,
                              validator: (value) {
                                return FieldValidator([
                                  ConfirmPasswordValidator(
                                      password:
                                      controller.newPasswordController.text),
                                ]).validate(value ?? '');
                              },
                            ),
                            40.h.height,
                            AppButtonWidget(
                              text: StringsManager.submitText,
                              onPressed: () {
                                controller.resetPassword(context);
                              },
                            ),
                            40.h.height,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
