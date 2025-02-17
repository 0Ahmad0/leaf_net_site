import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leaf_net_app/core/extension/space_ext.dart';
import 'package:leaf_net_app/core/strings_manager.dart';

import '../../../core/color_manager.dart';
import '../../widgets/app_button_widget.dart';
import '../../widgets/app_padding_widget.dart';
import '../../widgets/app_textfield_widget.dart';
import '../widgets/under_header_widget.dart';

class DiagnoseScreen extends StatelessWidget {
  const DiagnoseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        40.h.height,
        UnderHeaderWidget(
          text: StringsManager.diagnoseScreenText,
          image: 'assets/images/img_1.png',
        ),
        80.h.height,
        AppPaddingWidget(
          height: 0,
          width: 120.w,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12.r),
                    onTap: (){},
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: Get.height/2
                      ),
                      decoration: BoxDecoration(
                        color: ColorManager.grayColor.withOpacity(.25),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.photo_outlined,
                            size: 80.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                80.w.width,
                VerticalDivider(
                  color: ColorManager.primaryColor,
                ),
                80.w.width,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringsManager.uploadImageText,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorManager.primaryColor,
                                fontSize: 24.sp),
                          ),
                          40.w.width,
                          Icon(Icons.upload_rounded)
                        ],
                      ),
                      40.h.height,
                      Text(
                        StringsManager.selectImageText,
                        style: TextStyle(
                            color: ColorManager.primaryColor, fontSize: 14.sp),
                      ),
                      40.h.height,
                      AppPaddingWidget(
                        height: 0,
                        width: 150.w,
                        child: AppButtonWidget(
                          text: StringsManager.diagnosePlantText,
                          onPressed: () {},
                        ),
                      ),
                      20.h.height,
                      Text(
                        StringsManager.resultText,
                        style: TextStyle(
                            color: ColorManager.primaryColor, fontSize: 24.sp),
                      ),
                      AppTextField(
                        hintText: StringsManager.resultHintText,
                        minLine: 1,
                        maxLine: 10,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                      ) ,
                      40.h.height,
                      Text(
                        StringsManager.diagnoseNameText,
                        style: TextStyle(
                            color: ColorManager.primaryColor, fontSize: 24.sp),
                      ),
                      AppTextField(
                        hintText: StringsManager.resultHintText,
                        minLine: 1,
                        maxLine: 10,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
