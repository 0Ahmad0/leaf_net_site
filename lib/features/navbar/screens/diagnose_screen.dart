import 'dart:io';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leaf_net_app/core/extension/space_ext.dart';
import 'package:leaf_net_app/core/strings_manager.dart';
import 'package:leaf_net_app/features/navbar/controllers/diagnose_controller.dart';

import '../../../core/color_manager.dart';
import '../../widgets/app_button_widget.dart';
import '../../widgets/app_padding_widget.dart';
import '../../widgets/app_textfield_widget.dart';
import '../controllers/profile_controller.dart';
import '../widgets/header_app_widget.dart';
import '../widgets/under_header_widget.dart';

class DiagnoseScreen extends GetView<DiagnoseController> {
  const DiagnoseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DiagnoseController());
    return Column(
      children: [
        GetBuilder<ProfileController>(
            init: Get.put(ProfileController()),
            builder: (profileController) {
            return HeaderAppWidget(
              name:profileController.user?.completeName??""?? 'Sarah',
              title:
              StringsManager.diagnoseText+
                  ' Page',
            );
          }
        ),
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
                    onTap: () => controller.pickPhoto(context,
                        source: ImageSource.gallery),
                    child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      constraints: BoxConstraints(maxHeight: Get.height / 2),
                      decoration: BoxDecoration(
                        color: ColorManager.grayColor.withOpacity(.25),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: GetBuilder<DiagnoseController>(
                          init: DiagnoseController(),
                          builder: (context) {
                            return Stack(
                              children: [
                                Center(
                                  child: controller.userImage == null
                                      ? Icon(
                                          Icons.photo_outlined,
                                          size: 80.sp,
                                        )
                                      :
                                  getImageWidget(controller.userImage!.path),
                                  // Image.file(
                                  //         File(
                                  //           controller.userImage!.path,
                                  //         ),
                                  //         fit: BoxFit.cover,
                                  //       ),
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
                  child:
                GetBuilder<DiagnoseController>(
                init: DiagnoseController(),
    builder: (_context) =>
                  Column(
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
                          onPressed: () {
                            controller.diagnose(context);
                          },
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
                        controller:TextEditingController(text: controller.result?['disease']),
                        minLine: 1,
                        maxLine: 10,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                      ),
                      40.h.height,
                      Text(
                        StringsManager.diagnoseNameText,
                        style: TextStyle(
                            color: ColorManager.primaryColor, fontSize: 24.sp),
                      ),
                      AppTextField(
                        hintText: StringsManager.resultHintText,
                        controller:TextEditingController(text: controller.result?['plant_name']),
                        minLine: 1,
                        maxLine: 10,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                      )
                    ],)
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
  Widget getImageWidget(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      return Icon(
        Icons.photo_outlined,
        size: 80.sp,
      );
    }

    if (kIsWeb) {
      return Image.network(imagePath, fit: BoxFit.cover);
    } else {
      return Image.file(File(imagePath), fit: BoxFit.cover);
    }
  }
}
