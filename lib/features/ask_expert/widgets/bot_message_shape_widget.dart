import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:leaf_net_app/core/extension/space_ext.dart';

import '../../../core/color_manager.dart';

class BotMessageShapeWidget extends StatelessWidget {
  const BotMessageShapeWidget({super.key, required this.text});
  final String text;

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
            child: Text(
              text,
              style: TextStyle(
                color: ColorManager.blackColor,
              ),
            ),
          ),
          20.h.height,
          Text(
            DateFormat().add_jm().format(
              DateTime.now(),
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
