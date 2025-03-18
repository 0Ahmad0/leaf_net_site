import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leaf_net_app/features/ask_expert/controllers/ask_expert_controller.dart';
import 'package:leaf_net_app/features/ask_expert/widgets/bot_message_shape_widget.dart';
import 'package:leaf_net_app/features/ask_expert/widgets/user_message_shape_widget.dart';
import 'package:leaf_net_app/features/navbar/widgets/header_app_widget.dart';
import 'package:leaf_net_app/features/widgets/app_textfield_widget.dart';

import '../../../core/color_manager.dart';
import '../../../core/strings_manager.dart';
import '../../widgets/app_padding_widget.dart';

class AskExpertScreen extends GetView<AskExpertController> {
  const AskExpertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AskExpertController());
    return Scaffold(
      body: Column(
        children: [
          HeaderAppWidget(
            name: 'name',
            title: StringsManager.askExpertText,
          ),
          Expanded(
              child: GetBuilder<AskExpertController>(
                  init: AskExpertController(),
                  builder: (context) {
                    return SizedBox(
                      width: Get.width / 2.25,
                      child: controller.messages.isNotEmpty?ListView.builder(
                        controller: controller.scrollController,
                        padding: EdgeInsets.all(10.0),
                        itemCount: controller.messages.length,
                        itemBuilder: (context, index) =>

                        // index.isEven
                        controller.messages[index]['isUser'] as bool
                            ? UserMessageShapeWidget(
                                text: controller.messages[index]['message'],
                          time: controller.messages[index]['timestamp'],
                                // text: controller.messages[index],
                              )
                            : BotMessageShapeWidget(
                          time: controller.messages[index]['timestamp'],
                            isWrong: controller.messages[index]['isWrong']==true,
                                text: controller.messages[index]['message']),
                      ):Center(
                        child: Text(StringsManager.noMessagesYetText),
                      ),
                    );
                  })),
          AppPaddingWidget(
            child: GetBuilder<AskExpertController>(
                init: AskExpertController(),
                builder: (context) {
                  return SizedBox(
                    width: Get.width / 2.25,
                    child: Row(
                      children: [
                        Flexible(
                          child: AppTextField(
                            controller: controller.messageController,
                            hintText: StringsManager.typeHereText,
                          ),
                        ),
                        IconButton(
                          onPressed: controller.addMessage,
                          icon: CircleAvatar(
                            backgroundColor: ColorManager.primaryColor,
                            child: Icon(
                              Icons.send,
                              color: ColorManager.whiteColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
