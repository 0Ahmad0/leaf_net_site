import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:leaf_net_app/core/extension/space_ext.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../core/color_manager.dart';

class BotMessageShapeWidget extends StatelessWidget {
  const BotMessageShapeWidget({super.key, required this.text, required this.isWrong, this.time});
  final String text;
  final bool isWrong;
  final DateTime? time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: ColorManager.blackColor.withOpacity(.05),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                )),
            child:
            MarkdownBody(
              data: text ,
              styleSheet: MarkdownStyleSheet(
                p: const TextStyle(color: ColorManager.blackColor, fontSize: 16),
                strong: const TextStyle(color: ColorManager.blackColor, fontWeight: FontWeight.bold),
                em: const TextStyle(color: ColorManager.blackColor, fontStyle: FontStyle.italic),
                h1: const TextStyle(color: ColorManager.blackColor, fontSize: 24, fontWeight: FontWeight.bold),
                h2: const TextStyle(color:ColorManager.blackColor, fontSize: 22, fontWeight: FontWeight.bold),
                h3: const TextStyle(color: ColorManager.blackColor, fontSize: 20, fontWeight: FontWeight.bold),
                a: const TextStyle(color: Colors.lightBlue), // تنسيق الروابط
              ),
            ),

            // Text(
            //   text,
            //   style: TextStyle(
            //     color: ColorManager.blackColor,
            //   ),
            // ),
          ),
          20.h.height,
          Text(
            DateFormat().add_jm().format(
    time?? DateTime.now(),
            ),
            style: TextStyle(
                fontSize: 12.sp,
                color: ColorManager.blackColor.withOpacity(.45)
            ),
          )
        ],
      ),
    );
  }
}
