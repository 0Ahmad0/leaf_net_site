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
import 'package:leaf_net_app/features/auth/screens/forget_password_screen.dart';
import 'package:leaf_net_app/features/auth/screens/signup_screen.dart';
import 'package:leaf_net_app/features/auth/widgets/app_bar_widget.dart';
import 'package:leaf_net_app/features/auth/widgets/footer_widget.dart';
import 'package:leaf_net_app/features/navbar/screens/navbar_screen.dart';
import 'package:leaf_net_app/features/widgets/app_button_widget.dart';
import 'package:leaf_net_app/features/widgets/app_textfield_widget.dart';
import 'package:leaf_net_app/core/helper/validator/validator_helper.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginController());
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
                      StringsManager.loginText,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 50.sp,
                          color: ColorManager.primaryColor),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox.shrink(),
                        ),
                        Expanded(
                          child: Form(
                            key: controller.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(StringsManager.userNameText),
                                10.h.height,
                                AppTextField(
                                  controller: controller.userNameController,
                                  iconData: Icons.person_outline_sharp,
                                  hintText: StringsManager.userNameText,
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
                                ),
                                40.h.height,
                                Row(
                                  children: [
                                    Flexible(
                                        child: AppButtonWithBorderWidget(
                                      backgroundColor: Colors.white,
                                      textColor: ColorManager.primaryColor,
                                      text: StringsManager.forgetPasswordText,
                                      onPressed: () {
                                        Get.to(() => ForgetPasswordScreen(),
                                            transition: Transition.downToUp);
                                      },
                                    )),
                                    20.w.width,
                                    Flexible(
                                      child: AppButtonWidget(
                                        text: StringsManager.loginText,
                                        onPressed: () {
                                          if (controller.formKey.currentState!
                                              .validate()) {
                                            Get.to(
                                              () => NavbarScreen(),
                                              transition: Transition.topLevel
                                            );
                                          }
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
                                            StringsManager.doNotHaveAccountText,
                                      ),
                                      TextSpan(
                                          text: StringsManager.signUpText,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Get.off(() => SignupScreen(),
                                                  transition:
                                                      Transition.rightToLeft);
                                            },
                                          style: TextStyle(
                                            color: ColorManager.primaryColor,
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline,
                                          ))
                                    ]),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox.shrink(),
                        ),
                      ],
                    ),
                    FooterWidget()
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
