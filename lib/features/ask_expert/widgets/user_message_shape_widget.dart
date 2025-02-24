import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:leaf_net_app/core/color_manager.dart';
import 'package:leaf_net_app/core/extension/space_ext.dart';

class UserMessageShapeWidget extends StatelessWidget {
  const UserMessageShapeWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: ColorManager.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                  bottomLeft: Radius.circular(14),
                )),
            child: Text(
              text,
              style: TextStyle(
                color: ColorManager.whiteColor,
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
