import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leaf_net_app/core/extension/space_ext.dart';
import 'package:leaf_net_app/features/widgets/app_padding_widget.dart';

import '../../../core/strings_manager.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        AppPaddingWidget(
          height: 150.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(StringsManager.copyRightText),
              ),
              20.w.width,
              TextButton(
                onPressed: () {},
                child: Text(StringsManager.termsOfUseText),
              ),
              20.w.width,
              TextButton(
                onPressed: () {},
                child: Text(StringsManager.privacyPolicyText),
              )
            ],
          ),
        )
      ],
    );
  }
}
