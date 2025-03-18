//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'dart:ui' as ui;
// import '../../helpers/spacing.dart';
// import '../../utils/assets_manager.dart';
// import '../../utils/color_manager.dart';
// import 'src/content_type.dart';
//
// class ToastWidget extends StatelessWidget {
//   final String title;
//
//   final String message;
//
//
//   final ContentType contentType;
//
//   const ToastWidget({
//     Key? key,
//     required this.title,
//     required this.message,
//     required this.contentType,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return
//     Get.snackbar(title, textToast,
//         backgroundColor: state==null?null:state?ColorManager.successColor:ColorManager.errorColor,
//         colorText:  ColorManager.whiteColor);
//
//       BounceInUp(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Stack(
//             alignment: Alignment.center,
//             clipBehavior: Clip.none,
//             children: [
//               Container(
//                 constraints: BoxConstraints(minHeight: 100.h),
//                 padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 18.h),
//                 width: double.maxFinite,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20.r),
//                   color: contentType.backGroundColor,
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                      title,
//                       style: StyleManager.font16SemiBold(
//                           color: ColorManager.whiteColor),
//                     ),
//                     verticalSpace(6.h),
//                     Text(
//                       message,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: StyleManager.font14Regular(
//                           color: ColorManager.whiteColor),
//                     ),
//                   ],
//                 ),
//               ),
//               PositionedDirectional(
//                 top: -20.h,
//                 start: 0,
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     SvgPicture.asset(
//                       AssetsManager.backIcon,
//                       height: 40.h,
//                       // color: contentType.backIconColor,
//                       color: contentType.bubbleColor,
//                     ),
//                     PositionedDirectional(
//                       top: 10.h,
//                       child: SvgPicture.asset(
//                         assetSVG(contentType),
//                         color: ColorManager.whiteColor,
//                         height: 16.h,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               PositionedDirectional(
//                 bottom: 0,
//                 end: 0,
//                 child: ClipRRect(
//                   borderRadius: BorderRadiusDirectional.only(
//                       bottomEnd: Radius.circular(20.r)),
//                   child: Stack(
//                     children: [
//                       SvgPicture.asset(
//                         AssetsManager.bubblesIcon,
//                         width: 40.w,
//                         height: 40.h,
//                         // color: contentType.bubbleColor!.withOpacity(.21),
//                         color: contentType.bubbleColor!,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   String assetSVG(ContentType contentType) {
//     switch (contentType) {
//       case ContentType.failure:
//         return AssetsManager.failure;
//       case ContentType.success:
//         return AssetsManager.success;
//
//       case ContentType.help:
//         return AssetsManager.help;
//       default:
//         return AssetsManager.failure;
//     }
//   }
//
// }
