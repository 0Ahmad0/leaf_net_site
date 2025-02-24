import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leaf_net_app/core/assets_manager.dart';
import 'package:leaf_net_app/core/color_manager.dart';
import 'package:leaf_net_app/core/const_manager.dart';
import 'package:leaf_net_app/core/extension/space_ext.dart';
import 'package:leaf_net_app/core/strings_manager.dart';
import 'package:leaf_net_app/features/ask_expert/screens/ask_expert_screen.dart';
import 'package:leaf_net_app/features/auth/screens/signup_screen.dart';
import 'package:leaf_net_app/features/navbar/screens/diagnose_screen.dart';
import 'package:leaf_net_app/features/navbar/screens/identify_screen.dart';
import 'package:leaf_net_app/features/navbar/screens/navbar_screen.dart';
import 'package:leaf_net_app/features/widgets/app_padding_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: ColorManager.homeGrayColor),
          child: Column(
            children: [
              40.h.height,
              Image.asset(
                AssetsManager.logoIMG,
                width: 200.w,
                height: 200.h,
              ),
              40.h.height,
              AppPaddingWidget(
                height: 0,
                width: 100.w,
                child: Text(
                  textAlign: TextAlign.center,
                  StringsManager.homeScreenWelcomeText,
                  style: TextStyle(
                      fontSize: 24.sp, color: ColorManager.primaryColor),
                ),
              ),
            ],
          ),
        ),
        40.h.height,
        Text(
          StringsManager.exploreFeaturesText,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28.sp,
              color: ColorManager.primaryColor),
        ),
        80.h.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(100.r),
              onTap: () => Get.to(
                    () => Scaffold(
                        appBar: AppBar(),
                      body: IdentifyScreen()
                    ),
                transition: Transition.leftToRightWithFade
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50.sp,
                    backgroundColor: ColorManager.blackColor.withOpacity(.05),
                    child: AppPaddingWidget(
                      child: Image.asset(
                        ConstManager.homeList[0].image,
                      ),
                    ),
                  ),
                  40.h.height,
                  Text(
                    ConstManager.homeList[0].name,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(100.r),
              onTap: () => Get.to(
                    () => Scaffold(
                      appBar: AppBar(),
                        body: DiagnoseScreen()
                    ),
                  transition: Transition.rightToLeftWithFade
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50.sp,
                    backgroundColor: ColorManager.blackColor.withOpacity(.05),
                    child: AppPaddingWidget(
                      child: Image.asset(
                        ConstManager.homeList[1].image,
                      ),
                    ),
                  ),
                  40.h.height,
                  Text(
                    ConstManager.homeList[1].name,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(100.r),
              onTap: () => Get.to(
                    () => AskExpertScreen(),
                  transition: Transition.fadeIn
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50.sp,
                    backgroundColor: ColorManager.blackColor.withOpacity(.05),
                    child: AppPaddingWidget(
                      child: Image.asset(
                        ConstManager.homeList[2].image,
                      ),
                    ),
                  ),
                  40.h.height,
                  Text(
                    ConstManager.homeList[2].name,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
