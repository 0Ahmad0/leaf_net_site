import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leaf_net_app/core/assets_manager.dart';
import 'package:leaf_net_app/core/color_manager.dart';
import 'package:leaf_net_app/core/extension/space_ext.dart';
import 'package:leaf_net_app/core/strings_manager.dart';
import 'package:leaf_net_app/features/auth/controllers/login_controller.dart';
import 'package:leaf_net_app/features/auth/controllers/signup_controller.dart';
import 'package:leaf_net_app/features/auth/screens/login_screen.dart';
import 'package:leaf_net_app/features/auth/widgets/app_bar_widget.dart';
import 'package:leaf_net_app/features/auth/widgets/footer_widget.dart';
import 'package:leaf_net_app/features/widgets/app_button_widget.dart';
import 'package:leaf_net_app/features/widgets/app_padding_widget.dart';
import 'package:leaf_net_app/features/widgets/app_textfield_widget.dart';
import 'package:leaf_net_app/core/helper/validator/validator_helper.dart';
import 'package:leaf_net_app/core/helper/validator/validator_helper.dart';

class SignupScreen extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignupController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                AppBarWidget(),
                Row(
                  children: [
                    Expanded(
                      child: Form(
                        key: controller.formKey,
                        child: AppPaddingWidget(
                          width: 150.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(StringsManager.userNameText),
                              10.h.height,
                              AppTextField(
                                controller: controller.userNameController,
                                iconData: Icons.person_outline_sharp,
                                hintText: StringsManager.userNameText,
                                validator: (value) {
                                  return FieldValidator([
                                    UsernameValidator(),
                                  ]).validate(value ?? '');
                                },
                              ),
                              40.h.height,
                              Text(StringsManager.emailText),
                              10.h.height,
                              AppTextField(
                                validator: (value) {
                                  return FieldValidator([
                                    EmailValidator(),
                                  ]).validate(value ?? '');
                                },
                                controller: controller.emailController,
                                iconData: Icons.email_outlined,
                                hintText: StringsManager.emailText,
                              ),
                              40.h.height,
                              Text('Password :'),
                              10.h.height,
                              AppTextField(
                                controller: controller.passwordController,
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
                              Text('Confirm Password :'),
                              10.h.height,
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
                                            controller.passwordController.text),
                                  ]).validate(value ?? '');
                                },
                              ),
                              40.h.height,
                              Row(
                                children: [
                                  Flexible(
                                    child: AppButtonWidget(
                                      text: StringsManager.signUpText,
                                      onPressed: () {
                                        if (controller.formKey.currentState!
                                            .validate()) {}
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              40.h.height,
                              Align(
                                alignment: AlignmentDirectional.center,
                                child: Text.rich(
                                  TextSpan(children: [
                                    TextSpan(
                                      text:
                                          StringsManager.alreadyHaveAccountText,
                                    ),
                                    TextSpan(
                                        text: StringsManager.loginText,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Get.off(
                                              () => LoginScreen(),
                                                transition: Transition.downToUp
                                            );
                                          },
                                        style: TextStyle(
                                          color: ColorManager.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                        ))
                                  ]),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        Image.asset(
                          AssetsManager.logoIMG,
                          width: 200,
                          height: 200,
                        ),
                        20.h.height,
                        Text(
                          StringsManager.signUpText,
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 50.sp),
                        ),
                      ],
                    ))
                  ],
                ),
                FooterWidget()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
