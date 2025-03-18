
import 'package:flutter/cupertino.dart';

import '../../../color_manager.dart';

class ContentType {
  final String message;
  final Color? backIconColor;
  final Color? backGroundColor;
  final Color? bubbleColor;

  const ContentType(
    this.message,
    this.backIconColor,
    this.backGroundColor,
    this.bubbleColor,
  );

  static const ContentType help = ContentType(
    'help',
    // Color(0xff1E66B0),
    Color(0xff2EA4FB),
    ColorManager.primaryColor,
    Color(0xff1E66B0),
    // ColorManager.blackColor,
  );
  static  const ContentType failure = ContentType(
    'failure',
    Color(0xffFF4D4F),
    ColorManager.errorColor,
    Color(0xffC93D3E),
    // ColorManager.blackColor,
  );
  static const ContentType success = ContentType(
    'success',
    // Color(0xff52C41A),
    Color(0xff52C41A),
    ColorManager.successColor,
    Color(0xff82DD56),

    // ColorManager.blackColor,
  );
}
