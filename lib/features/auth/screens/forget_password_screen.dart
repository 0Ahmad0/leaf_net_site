import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leaf_net_app/core/assets_manager.dart';
import 'package:leaf_net_app/core/color_manager.dart';
import 'package:leaf_net_app/core/extension/space_ext.dart';
import 'package:leaf_net_app/core/strings_manager.dart';
import 'package:leaf_net_app/features/auth/controllers/forget_password_controller.dart';
import 'package:leaf_net_app/features/auth/controllers/login_controller.dart';
import 'package:leaf_net_app/features/auth/screens/signup_screen.dart';
import 'package:leaf_net_app/features/auth/widgets/app_bar_widget.dart';
import 'package:leaf_net_app/features/auth/widgets/footer_widget.dart';
import 'package:leaf_net_app/features/widgets/app_button_widget.dart';
import 'package:leaf_net_app/features/widgets/app_textfield_widget.dart';
import 'package:leaf_net_app/core/helper/validator/validator_helper.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ForgetPasswordController());
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
                        color: ColorManager.primaryColor
                      ),
                    ),
                    10.h.height,
                    Text(
                      StringsManager.receivePasswordResetLinkText,
                      style: TextStyle(color: ColorManager.primaryColor),
                    ),
                    20.h.height,
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
                                Text(StringsManager.emailText),
                                10.h.height,
                                AppTextField(
                                  controller: controller.emailController,
                                  iconData: Icons.email_outlined,
                                  hintText: StringsManager.emailText,
                                ),
                                40.h.height,
                                AppButtonWidget(
                                  text: StringsManager.submitText,
                                  onPressed: () {},
                                ),
                                40.h.height,
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
