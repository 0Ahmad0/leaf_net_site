import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leaf_net_app/core/color_manager.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    super.key,
    required this.text,
    this.onPressed,
    this.textColor = ColorManager.whiteColor,
    this.backgroundColor = ColorManager.primaryColor,
  });

  final String text;
  final VoidCallback? onPressed;
  final Color? textColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r)
        ),
        backgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}

class AppButtonWithBorderWidget extends StatelessWidget {
  const AppButtonWithBorderWidget({
    super.key,
    required this.text,
    this.onPressed,
    this.textColor = ColorManager.whiteColor,
    this.backgroundColor = ColorManager.primaryColor,
    this.borderColor = ColorManager.primaryColor,
  });

  final String text;
  final VoidCallback? onPressed;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          side: BorderSide(
            color: borderColor!,
            width: 1.sp
          )
        ),
        backgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}


