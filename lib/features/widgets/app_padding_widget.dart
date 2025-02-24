import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPaddingWidget extends StatelessWidget {
  const AppPaddingWidget(
      {super.key, this.width = 20, this.height = 20, this.child});

  final double width;
  final double height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width.w,
        vertical: height.h,
      ),
      child: child,
    );
  }
}
