import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leaf_net_app/core/const_manager.dart';
import 'package:leaf_net_app/core/strings_manager.dart';
import 'package:leaf_net_app/core/theme_manager.dart';
import 'package:leaf_net_app/features/splash/splash_screen.dart';

import 'navbar/controllers/profile_controller.dart';

class LeafNetApp extends StatelessWidget {
  const LeafNetApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: Size(
        ConstManager.width,
        ConstManager.height,
      ),
      builder: (context, child) {
        return GetMaterialApp(
          title: StringsManager.appName,
          showSemanticsDebugger: false,
          theme: ThemeManager.myTheme,
          home: SplashScreen(),
        );
      },
    );
  }
}
