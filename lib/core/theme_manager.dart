import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leaf_net_app/core/color_manager.dart';
import 'package:leaf_net_app/core/extension/material_color_ext.dart';
import 'package:leaf_net_app/features/app.dart';

class ThemeManager {
  static final _font = GoogleFonts.josefinSans();

  static final myTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      minimumSize: WidgetStatePropertyAll(
        Size(double.maxFinite, 100.h),
      ),
    )),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(
              color: ColorManager.blackColor,
              fontFamily: _font.fontFamily),
        ),
      ),
    ),
    fontFamily: _font.fontFamily,
    primaryColor: ColorManager.primaryColor,
    primarySwatch: ColorManager.primaryColor.toMaterialColor(),
  );
}
