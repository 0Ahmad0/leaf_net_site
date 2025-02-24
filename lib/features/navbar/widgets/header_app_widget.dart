import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leaf_net_app/core/extension/space_ext.dart';

import '../../../core/assets_manager.dart';
import '../../../core/color_manager.dart';
import '../../../core/strings_manager.dart';
import '../../widgets/app_padding_widget.dart';

class HeaderAppWidget extends StatelessWidget {
  const HeaderAppWidget({
    super.key,
    required this.name,
    required this.title,
  });

  final String name;
  final String title;

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
                BackButton(),
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
                      name,
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    Text(
                      StringsManager.plantEnthusiastText,
                    ),
                  ],
                ),
                Expanded(child: SizedBox.shrink()),
                Flexible(
                    child: Text(
                  title,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 40.sp),
                )),
                Expanded(child: SizedBox.shrink()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
