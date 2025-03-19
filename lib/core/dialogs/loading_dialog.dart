import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../assets_manager.dart';
import '../color_manager.dart';

class LoadingDialog {
  static void show(BuildContext context,
      {String? message, String image = AssetsManager.loadingPlantIMG}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      // Prevents dialog from being dismissed by tapping outside
      builder: (BuildContext context) {
        return PopScope(
            // canPop:false, // Prevents back navigation
            child: Center(
          child: Lottie.asset(
            image,
            width: 450.w,
            height: 450.h,
          ),
        ));
      },
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
