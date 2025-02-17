import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leaf_net_app/core/extension/space_ext.dart';
import 'package:leaf_net_app/features/widgets/app_padding_widget.dart';

import '../../../core/strings_manager.dart';

class FooterAppWidget extends StatelessWidget {
  const FooterAppWidget({
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
                child: Text(StringsManager.aboutUsText),
              ),
              80.w.width,
              TextButton(
                onPressed: () {},
                child: Text(StringsManager.termsOfUseText),
              ),
              80.w.width,
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
