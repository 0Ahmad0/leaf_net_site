import 'package:flutter/material.dart';

import '../color_manager.dart';


class LoadingDialog {
  static void show(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevents dialog from being dismissed by tapping outside
      builder: (BuildContext context) {
        return PopScope(
            // canPop:false, // Prevents back navigation
          child:
          // Center(
          //   child: Lottie.asset(AssetsManager.loading6Json,
          //       width: 200.w,
          //       height: 200.h
          //   ),
          // )
          Center(
            child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                    color: ColorManager.whiteColor,
                    borderRadius: BorderRadius.circular(8)),
                child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                )),
          )


          // AlertDialog(
          //   content:
          //   Row(
          //     children: [
          //       CircularProgressIndicator(),
          //       SizedBox(width: 20),
          //       Expanded(
          //         child: Text(message ?? 'Loading...'),
          //       ),
          //     ],
          //   ),
          // ),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
