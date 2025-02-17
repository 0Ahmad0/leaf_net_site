import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:leaf_net_app/core/assets_manager.dart';
import 'package:leaf_net_app/core/color_manager.dart';
import 'package:leaf_net_app/core/const_manager.dart';
import 'package:leaf_net_app/core/extension/space_ext.dart';
import 'package:leaf_net_app/core/strings_manager.dart';
import 'package:leaf_net_app/features/app.dart';
import 'package:leaf_net_app/features/auth/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _goToNextScreen() {
    Future.delayed(Duration(seconds: ConstManager.splashTime), () {
      Get.offAll(
        () => LoginScreen(),
        transition: Transition.fadeIn
      );
    });
  }


  @override
  void initState() {
    _goToNextScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          FadeInDownBig(
            child: Image.asset(
              AssetsManager.logoIMG,
              width: 500.w,
              height: 500.h,
            ),
          ),
          const Spacer(),
          SpinKitCircle(
            color: ColorManager.primaryColor,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
