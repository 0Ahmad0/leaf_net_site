// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:maqsaf_app/core/widgets/toast_widget/src/content_type.dart';
// import 'toast_widget.dart';
//
// class ToastManager {
//   static void showToast({
//     required BuildContext context,
//     required String title,
//     required String message,
//     required ContentType contentType,
//     ToastGravity gravity = ToastGravity.TOP,
//     int duration = 3, // Duration in seconds
//   }) {
//     FToast fToast = FToast(
//     );
//     fToast.init(context);
//
//     fToast.showToast(
//       child: ToastWidget(
//         title: title,
//         message: message,
//         contentType: contentType,
//       ),
//       gravity: gravity,
//       toastDuration: Duration(seconds: duration),
//
//     );
//   }
//
//   static void cancelAllToasts() {
//     Fluttertoast.cancel();
//   }
// }
