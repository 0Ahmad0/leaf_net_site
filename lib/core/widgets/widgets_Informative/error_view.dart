
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../domain/error_handler/network_exceptions.dart';
import '../../assets_manager.dart';
import '../../color_manager.dart';
import '../../strings_manager.dart';


class ErrorView extends StatelessWidget {
  ErrorView({super.key, this.networkExceptions, this.pathImage, this.onRetry});
  final NetworkExceptions? networkExceptions;
  final VoidCallback? onRetry;
  String? pathImage;
  @override
  Widget build(BuildContext context) {
    Widget errorView = ErrorViewBase(
      value: "Error!",
      assetSvg: pathImage,
    );

    if (networkExceptions != null) {
      networkExceptions!.when(
        notImplemented: () {
          errorView = ErrorViewBase(
            value: NetworkExceptions.getErrorMessage(networkExceptions!),
            onRetry: onRetry,
          );
        },
        requestCancelled: () {
          errorView = ErrorViewBase(
            value: NetworkExceptions.getErrorMessage(networkExceptions!),
            onRetry: onRetry,
          );
        },
        loggingInRequired: () {
          errorView = ErrorViewBase(
            value: NetworkExceptions.getErrorMessage(networkExceptions!),
            onRetry: onRetry,
          );
        },
        internalServerError: (String reason) {
          errorView = ErrorViewBase(
            value: NetworkExceptions.getErrorMessage(networkExceptions!),
            onRetry: onRetry,
          );
        },
        notFound: (String reason) {
          errorView = ErrorViewBase(
            value: NetworkExceptions.getErrorMessage(networkExceptions!),
            onRetry: onRetry,
          );
        },
        serviceUnavailable: () {
          errorView = ErrorViewBase(
            value: NetworkExceptions.getErrorMessage(networkExceptions!),
            onRetry: onRetry,
          );
        },
        methodNotAllowed: () {
          errorView = ErrorViewBase(
            value: NetworkExceptions.getErrorMessage(networkExceptions!),
            onRetry: onRetry,
          );
        },
        badRequest: () {
          errorView = ErrorViewBase(
            value: NetworkExceptions.getErrorMessage(networkExceptions!),
            onRetry: onRetry,
          );
        },
        unauthorizedRequest: (String error) {
          errorView = ErrorViewBase(
            value: NetworkExceptions.getErrorMessage(networkExceptions!),
            onRetry: onRetry,
          );
        },
        unprocessableEntity: (String error) {
          errorView = ErrorViewBase(
            value: NetworkExceptions.getErrorMessage(networkExceptions!),
            onRetry: onRetry,
          );
        },
        unexpectedError: (String? error) {
          errorView = ErrorViewBase(
            value: NetworkExceptions.getErrorMessage(networkExceptions!),
            onRetry: onRetry,
          );
        },
        requestTimeout: () {
          errorView = ErrorViewBase(
            value: NetworkExceptions.getErrorMessage(networkExceptions!),
            onRetry: onRetry,
          );
        },
        noInternetConnection: () {
          errorView = ErrorViewBase(
            value: NetworkExceptions.getErrorMessage(networkExceptions!),
            onRetry: onRetry,
            icon: Icons.wifi_off_outlined,
          );
        },
        conflict: () {
          errorView = ErrorViewBase(
            value: NetworkExceptions.getErrorMessage(networkExceptions!),
            onRetry: onRetry,
          );
        },
        sendTimeout: () {
          errorView = ErrorViewBase(
            value: NetworkExceptions.getErrorMessage(networkExceptions!),
            onRetry: onRetry,
          );
        },
        unableToProcess: () {
          errorView = ErrorViewBase(
            value: NetworkExceptions.getErrorMessage(networkExceptions!),
            onRetry: onRetry,
          );
        },
        defaultError: (String error) {
          errorView = ErrorViewBase(
            value: NetworkExceptions.getErrorMessage(networkExceptions!),
            onRetry: onRetry,
          );
        },
        formatException: () {
          errorView = ErrorViewBase(
            value: NetworkExceptions.getErrorMessage(networkExceptions!),
            onRetry: onRetry,
          );
        },
        notAcceptable: () {
          errorView = ErrorViewBase(
            value: NetworkExceptions.getErrorMessage(networkExceptions!),
            onRetry: onRetry,
          );
        },
      );
    }
    return errorView;
  }
}

class ErrorViewBase extends StatelessWidget {
  const ErrorViewBase({super.key, this.value, this.icon, this.assetSvg, this.onRetry});

  //final NetworkExceptions? networkExceptions;
  final String? value;
  final IconData? icon;
  final String? assetSvg;
  final VoidCallback? onRetry;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(

    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // assetSvg == null
      //     ? SvgPicture.asset(
      //     assetSvg ?? AssetsManager.noDataFoundIMG,
      //     // width: ScreenUtil.defaultSize.width / 2,
      //     // height: ScreenUtil.defaultSize.width / 2,
      //       )
      //     :
      Icon(
              icon ?? Icons.report,
              size: ScreenUtil.defaultSize.width / 3,
              color: ColorManager.whiteColor,
              // color: ColorManager.grayColor,
            ),
       SizedBox(
        height: 10.w,
      ),
      if(onRetry!=null)
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: ScreenUtil.defaultSize.width /4),
          child: TextButton(child:Text( StringsManager.retryText,style:TextStyle(color: ColorManager.primaryColor,)),
            onPressed: onRetry,
          ),
        ),
      Text(
        value ?? '',
        style: TextStyle(
          fontSize: ScreenUtil.defaultSize.width / 16,
          color: Colors.white,
          // color: Colors.grey,
        ),
      )
    ],
      ),
    );
  }
}

// class ErrorViewSlideBar extends StatelessWidget {
//   ErrorViewSlideBar({this.value, this.icon, this.assetSvg});
//
//   //final NetworkExceptions? networkExceptions;
//   final String? value;
//   final IconData? icon;
//   final String? assetSvg;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         assetSvg == null
//             ? Center(
//                 child: SvgPicture.asset(
//                   assetSvg ?? InfoAssets.not_found_second,
//                 ),
//               )
//             : Icon(
//                 icon ?? Icons.report,
//                 size: ScreenUtil.defaultSize.width / 3,
//                 color: AppColors.lightGray,
//               ),
//         SizedBox(
//           height: 10.h,
//         ),
//         Text(
//           value ?? '',
//           style: TextStyle(
//             fontSize: ScreenUtil.defaultSize.width / 16,
//             color: Colors.grey,
//           ),
//         )
//       ],
//     );
//   }
// }
