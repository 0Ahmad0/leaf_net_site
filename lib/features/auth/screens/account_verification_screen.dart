import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leaf_net_app/core/assets_manager.dart';
import 'package:leaf_net_app/core/color_manager.dart';
import 'package:leaf_net_app/core/extension/space_ext.dart';
import 'package:leaf_net_app/core/strings_manager.dart';
import 'package:leaf_net_app/features/auth/controllers/account_verification_controller.dart';
import 'package:leaf_net_app/features/auth/widgets/app_bar_widget.dart';
import 'package:leaf_net_app/features/widgets/app_button_widget.dart';

import 'login_screen.dart';

class AccountVerificationScreen extends GetView<AccountVerificationController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AccountVerificationController());
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
                      StringsManager.accountVerificationText,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 50.sp,
                        color: ColorManager.primaryColor,
                      ),
                    ),
                    10.h.height,
                    Text(
                      StringsManager.enterSixDigitFromEmailText,
                      style: TextStyle(color: ColorManager.primaryColor),
                    ),
                    80.h.height,
                    Form(
                      key: controller.formKey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(6, (index) {
                          return Container(
                            alignment: Alignment.center,
                            width: 50.sp,
                            height: 50.sp,
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            child: TextFormField(
                              autofocus: true,
                              controller: controller.otpControllers[index],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100.r),
                                    borderSide: BorderSide(
                                        color: ColorManager.grayColor)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100.r),
                                    borderSide: BorderSide(
                                      color: ColorManager.grayColor,
                                    )),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100.r),
                                    borderSide: BorderSide(
                                        color: ColorManager.errorColor)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100.r),
                                    borderSide: BorderSide(
                                        color: ColorManager.primaryColor,
                                        width: 2.sp)),
                              ),
                              onChanged: (value) {
                                if (value.length == 1 && index < 5) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                            ),
                          );
                        }),
                      ),
                    ),
                    80.h.height,
                    SizedBox(
                        width: 350.w,
                        child: AppButtonWidget(
                          text: StringsManager.verifyAccountText,
                          onPressed: () {
                            controller.verifyEmail(context);
                          },
                        )),
                    40.h.height,
                    TextButton(
                        onPressed: () => Get.offAll(LoginScreen(),
                            transition: Transition.rightToLeftWithFade),
                        child: Text(
                          StringsManager.goToLoginText,
                          style: TextStyle(
                              color: ColorManager.errorColor, fontSize: 16.sp),
                        ))
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
