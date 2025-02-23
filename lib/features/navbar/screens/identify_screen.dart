import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leaf_net_app/core/color_manager.dart';
import 'package:leaf_net_app/core/extension/space_ext.dart';
import 'package:leaf_net_app/features/navbar/controllers/identify_controller.dart';
import 'package:leaf_net_app/features/widgets/app_button_widget.dart';
import 'package:leaf_net_app/features/widgets/app_padding_widget.dart';
import 'package:leaf_net_app/features/widgets/app_textfield_widget.dart';

import '../../../core/strings_manager.dart';
import '../widgets/under_header_widget.dart';

class IdentifyScreen extends GetView<IdentifyController> {
  const IdentifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>IdentifyController());
    return Column(
      children: [
        40.h.height,
        UnderHeaderWidget(
          text: StringsManager.identifyScreenText,
          image: 'assets/images/img.png',
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
                    onTap: () => controller.pickPhoto(context,
                        source: ImageSource.gallery),
                    child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      constraints: BoxConstraints(maxHeight: Get.height / 2),
                      decoration: BoxDecoration(
                        color: ColorManager.grayColor.withOpacity(.25),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: GetBuilder<IdentifyController>(
                          init: IdentifyController(),
                          builder: (context) {
                            return Stack(
                              children: [
                                Center(
                                  child: controller.userImage == null
                                      ? Icon(
                                    Icons.photo_outlined,
                                    size: 80.sp,
                                  )
                                      : Image.file(
                                    File(
                                      controller.userImage!.path,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Visibility(
                                  visible: controller.userImage != null,
                                  child: IconButton(
                                    onPressed:  controller.deletePhoto,
                                    icon: CircleAvatar(
                                      backgroundColor: ColorManager.errorColor,
                                      child: Icon(
                                        Icons.delete_outline,
                                        color: ColorManager.whiteColor,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          }),
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
                          text: StringsManager.identifyPlantText,
                          onPressed: () {},
                        ),
                      ),
                      80.h.height,
                      Text(
                        StringsManager.resultText,
                        style: TextStyle(
                            color: ColorManager.primaryColor, fontSize: 24.sp),
                      ),
                      40.h.height,
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
