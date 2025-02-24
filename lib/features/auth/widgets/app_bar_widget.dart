import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leaf_net_app/core/extension/space_ext.dart';
import 'package:leaf_net_app/features/widgets/app_padding_widget.dart';

import '../../../core/assets_manager.dart';
import '../../../core/color_manager.dart';
import '../../../core/strings_manager.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            width: double.infinity,
            decoration: BoxDecoration(color: ColorManager.underAppBarColor),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40.sp,
                  backgroundColor: ColorManager.grayColor,
                  child: AppPaddingWidget(
                    child: Image.asset(
                      AssetsManager.farmerIMG,
                    ),
                  ),
                ),
                30.w.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringsManager.welcomeBackText,
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    Text(
                      StringsManager.plantEnthusiastText,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
