import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leaf_net_app/core/assets_manager.dart';

import '../../../core/color_manager.dart';
import '../../widgets/app_padding_widget.dart';

class UnderHeaderWidget extends StatelessWidget {
  const UnderHeaderWidget({super.key, required this.text, required this.image});

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.navbarSectionsColor,
      ),
      child: AppPaddingWidget(
        child: Row(
          children: [
            Expanded(
              child: Image.asset(
                AssetsManager.identifyPlantIMG,
                width: 180.w,
                height: 180.h,
              ),
            ),
            Expanded(
              flex: 2,
                child: AppPaddingWidget(
                  height: 0,
                  width: 80.w,
                  child: Text(
                                textAlign: TextAlign.center,
                                text,
                    style: TextStyle(
                      fontSize: 16.sp
                    ),
                              ),
                )),
            Expanded(
              child: Image.asset(
                image,
                width: 200.w,
                height: 200.h,
              ),
            )
          ],
        ),
      ),
    );
  }
}
