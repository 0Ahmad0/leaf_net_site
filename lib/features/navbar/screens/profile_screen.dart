import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leaf_net_app/core/assets_manager.dart';
import 'package:leaf_net_app/core/color_manager.dart';
import 'package:leaf_net_app/core/extension/space_ext.dart';
import 'package:leaf_net_app/features/navbar/controllers/profile_controller.dart';
import 'package:leaf_net_app/features/splash/splash_screen.dart';
import 'package:leaf_net_app/features/widgets/app_button_widget.dart';
import 'package:leaf_net_app/features/widgets/app_padding_widget.dart';

import '../../../core/helper/validator/validator_helper.dart';
import '../../../core/strings_manager.dart';
import '../../auth/controllers/login_controller.dart';
import '../../widgets/app_textfield_widget.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProfileController());
    return Stack(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: Get.height * .8,
          ),
          child: Image.asset(
            AssetsManager.backLoginIMG,
            color: ColorManager.primaryColor.withOpacity(.05),
          ),
        ),
        Column(
          children: [
            40.h.height,
            InkWell(
              hoverColor: Colors.transparent,
              canRequestFocus: false,
              onTap: () =>
                  controller.pickPhoto(context, source: ImageSource.gallery),
              child: GetBuilder<ProfileController>(
                  init: ProfileController(),
                builder: (context) {
                  return Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        width: 300.w,
                        height: 300.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.grayColor,
                        ),
                        child: controller.userImage == null
                            ? Image.asset(
                                AssetsManager.farmerIMG,
                                width: 200.w,
                                height: 200.h,
                              )
                            :
                        getImageWidget(controller.userImage!.path)
                        // Image.file(
                        //         File(controller.userImage!.path),
                        //   fit: BoxFit.cover,
                        //       ),
                      ),
                      PositionedDirectional(
                        end: 60.w,
                        bottom: 0,
                        child: CircleAvatar(
                          backgroundColor: ColorManager.primaryColor,
                          radius: 26.sp,
                          child: Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 26.sp,
                            color: ColorManager.whiteColor,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: controller.userImage !=null,
                        child: PositionedDirectional(
                          start: 60.w,
                          bottom: 0,
                          child: GestureDetector(
                            onTap: controller.deletePhoto,
                            child: CircleAvatar(
                              backgroundColor: ColorManager.errorColor,
                              radius: 26.sp,
                              child: Icon(
                                Icons.delete_outline,
                                size: 26.sp,
                                color: ColorManager.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  );
                }
              ),
            ),
            20.h.height,
            Text(
              StringsManager.chooseImageText,
              style: TextStyle(
                  color: ColorManager.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 28.sp),
            ),
            Row(
              children: [
                Expanded(child: SizedBox.shrink()),
                Expanded(
                    child: AppPaddingWidget(
                  child: Stack(
                    children: [
                      Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringsManager.nameText,
                              style:
                                  TextStyle(color: ColorManager.primaryColor),
                            ),
                            10.h.height,
                            AppTextField(
                              controller: controller.nameController,
                              iconData: Icons.person_outline_sharp,
                              hintText: StringsManager.nameText,
                              validator: (value) {
                                return FieldValidator([
                                  RequiredValidator(),
                                  // UsernameValidator(),
                                ]).validate(value ?? '');
                              },
                            ),
                            40.h.height,
                            Text(
                              StringsManager.userNameText,
                              style:
                                  TextStyle(color: ColorManager.primaryColor),
                            ),
                            10.h.height,
                            AppTextField(
                              controller: controller.userNameController,
                              iconData: Icons.person_outline_sharp,
                              hintText: StringsManager.userNameText,
                              validator: (value) {
                                return FieldValidator([
                                  RequiredValidator(),
                                  UsernameValidator(),
                                ]).validate(value ?? '');
                              },
                            ),
                            40.h.height,
                            Text(
                              StringsManager.userNameText,
                              style:
                                  TextStyle(color: ColorManager.primaryColor),
                            ),
                            10.h.height,
                            AppTextField(
                              controller: controller.emailController,
                              iconData: Icons.email_outlined,
                              hintText: StringsManager.emailText,
                              validator: (value) {
                                return FieldValidator([
                                  RequiredValidator(),
                                  EmailValidator(),
                                ]).validate(value ?? '');
                              },
                            ),
                            60.h.height,
                            Row(
                              children: [
                                Expanded(
                                  child: AppButtonWidget(
                                    text: StringsManager.saveText,
                                    onPressed: () {
                                      if (controller.formKey.currentState!
                                          .validate()) {
                                        controller.updateProfile(context);
                                      }
                                    },
                                  ),
                                ),
                                40.w.width,
                                Expanded(
                                    child: AppButtonWithBorderWidget(
                                  text: StringsManager.logoutText,
                                  textColor: ColorManager.whiteColor,
                                  backgroundColor: ColorManager.errorColor,
                                  borderColor: ColorManager.errorColor,
                                  onPressed: () {
                                    Get.put(LoginController()).logout(context);


                                  },
                                )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
                Expanded(child: SizedBox.shrink()),
              ],
            )
          ],
        ),
      ],
    );
  }
  Widget getImageWidget(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      return Image.asset(
        AssetsManager.farmerIMG,
        width: 200.w,
        height: 200.h,
      );
    }

    if (kIsWeb) {
      return Image.network(imagePath, fit: BoxFit.cover);
    } else {
      return Image.file(File(imagePath), fit: BoxFit.cover);
    }
  }
}
