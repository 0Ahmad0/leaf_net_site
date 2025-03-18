import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:leaf_net_app/core/color_manager.dart';

import '../../navbar/controllers/profile_controller.dart';

class AskExpertController extends GetxController {
  final messageController = TextEditingController();
  // List<String> messages = [];

 final ScrollController scrollController = ScrollController();


  final List<Map<String, dynamic>> messages = [];


  GenerativeModel? model;
  @override
  void onInit() {
    init();
    super.onInit();
  }
  Future<void> init() async {
    model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: "AIzaSyDob9CbYcZO0xNWn7N3p_yhlArbSqiqDrY",
    );

    isLoading=false;

  }
  bool isLoading=false;


  Future<void> _sendMessageAi(String message)async {
    final user= Get.put(ProfileController()).user;
    if(isLoading) return;
    if (message.trim().isEmpty) return;

      messages.add({
        'isUser': true,
        'message': message,
        'timestamp': DateTime.now(),
      });
      messages.add({
        'isUser': false,
        'message': "loading ..",
        'timestamp': DateTime.now(),
      });
      isLoading=true;
      update();

    messageController.clear();
    Future.delayed(const Duration(milliseconds: 100), () {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
    try{
      // final response = await model?.generateContent([Content.text(
      //     ("مرحبا،اريد الاجابات ان تكون متعلقة ضمن نطاق (الطالب والوجبات وطلبات الوجبات والوجبات المفضلة والمحذوفة ومكونات الوجبات وسلة الوجبات والدفع لاوردر الوجبات وبطاقات الدفع) سوف ارسل لك معلومات الطالب اريد اجاباتك التالية بناء على هذه المعلومات،الطول  ${user?.height??""} سم، الوزن  ${user?.weight??""} كغ، الاسم  ${user?.completeName??""}، العمر  ${user?.age??""} سنة، الجنس  ${user?.gender??""}.")
      //         +"\n"+"السؤال:${message}"
      //   // message
      // )]);
      final response = await model?.generateContent([Content.text(
          message
      )]);
      messages.removeLast();
      messages.add({

        'isUser': false,
        'message': response?.text??"",
        'timestamp': DateTime.now(),
      });
    }catch(e){
      messages.removeLast();
      messages.add({
        'isWrong': true,
        'isUser': false,
        'message': 'Error, Try again ❗️',
        // 'message': 'حدث خطأ، حاول مرة أخرى❗️',
        'timestamp': DateTime.now(),
      });
    }finally{
      isLoading=false;
    }
   update();
    Future.delayed(const Duration(milliseconds: 100), () {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }



  void addMessage(){
    if(messageController.text.trim().isNotEmpty){
      // messages.add(messageController.text);
      // messageController.clear();
      // update();
      _sendMessageAi(messageController.text);

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
