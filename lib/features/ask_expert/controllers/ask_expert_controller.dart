import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leaf_net_app/core/color_manager.dart';

class AskExpertController extends GetxController {
  final messageController = TextEditingController();
  List<String> messages = [];


  void addMessage(){
    if(messageController.text.trim().isNotEmpty){
      messages.add(messageController.text);
      messageController.clear();
      update();

    }
    else {
      Get.showSnackbar(
        GetSnackBar(

          margin: EdgeInsets.all(10),
          borderRadius: 8.0,
          duration: Duration(milliseconds: 1300),
          backgroundColor: ColorManager.errorColor,
          title: 'Error',
          message: 'Can\'t be send Empty Message',
        )
      );
    }
  }
  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}
