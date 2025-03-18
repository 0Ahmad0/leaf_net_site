
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../features/auth/screens/account_verification_screen.dart';
import '../../features/navbar/controllers/profile_controller.dart';
import '../data/enums/toast_status.dart';
import '../domain/error_handler/message.dart';
import '../domain/error_handler/network_exceptions.dart';
import '../widgets/constants_widgets.dart';
import '../widgets/toast_widget/toast_manager.dart';

class ResponseHelper {
  static void onSuccess(BuildContext context, {String? message, String? title}) {
    // showDialog(context: context, builder: (context)=>
        // ToastWidget(title: (title??ToastStatus.success.name), message: MessageApi.findTextToast(message ?? ''), contentType: ContentType.success,)
    /// ToastManager.showToast(context: context,title: (title??ToastStatus.success.name), message: MessageApi.findTextToast(message ?? ''), contentType: ContentType.success,);
    // );
    ConstantsWidgets.TOAST(null, title: title??ToastStatus.success.name,textToast:MessageApi.findTextToast(message ?? '') , state: true);
  }

  static void onFailure(BuildContext context, {String? message, String? title}) {

    // showDialog(context: context, builder: (context)=>
        // ToastWidget(title: (title??ToastStatus.failure.name), message: MessageApi.findTextToast(message ?? ''), contentType: ContentType.failure,)
   /// ToastManager.showToast( context: context,title: (title??ToastStatus.failure.name), message: MessageApi.findTextToast(message ?? ''), contentType: ContentType.failure);
    // );
    ConstantsWidgets.TOAST(null, title: title??ToastStatus.failure.name,textToast:MessageApi.findTextToast(message ?? '') , state: false);
  }

  static void onNetworkFailure(BuildContext context, {NetworkExceptions? networkException, String? title}) {
    onFailure(context, message: NetworkExceptions.getErrorMessage(networkException), title: title);

    if ([NetworkExceptions.unauthorizedRequest('').runtimeType].contains(
        networkException.runtimeType
    )
        ) {
      Get.offAll(
              () => AccountVerificationScreen(),
          arguments: {"email": Get.put(ProfileController()).user?.email},
          transition: Transition.topLevel
      );
     // BlocProvider.of<AuthCubit>(context).refreshToken(context);
    }

    // BlocProvider.of<AdvanceCubit>(context).failureAdvance(context, networkException);
  }
}