import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leaf_net_app/core/extension/space_ext.dart';
import 'package:leaf_net_app/features/navbar/controllers/navbar_controller.dart';
import 'package:leaf_net_app/features/navbar/widgets/header_app_widget.dart';

import '../../../core/assets_manager.dart';
import '../../../core/color_manager.dart';
import '../../../core/const_manager.dart';
import '../../../core/strings_manager.dart';
import '../../widgets/app_padding_widget.dart';
import '../../widgets/app_textfield_widget.dart';
import '../widgets/footer_app_widget.dart';

class NavbarScreen extends GetView<NavbarController> {
  const NavbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => NavbarController());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: AppPaddingWidget(
              child: Row(
                children: [
                  if (Navigator.canPop(context)) BackButton(),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: ColorManager.grayColor,
                        child: Image.asset(
                          AssetsManager.logoIMG,
                        ),
                      ),
                      20.w.width,
                      Text(StringsManager.appName)
                    ],
                  ),
                  const Spacer(),
                  GetBuilder<NavbarController>(
                      init: NavbarController(),
                      builder: (context) {
                        return Row(
                          children: List.generate(
                            ConstManager.appBarPages.length,
                            (index) => TextButton(
                              onPressed: () => controller.changeIndex(index),
                              child: Text(
                                ConstManager.appBarPages[index].name,
                                style: TextStyle(
                                    fontWeight: index == controller.currentIndex
                                        ? FontWeight.bold
                                        : null,
                                    color: index == controller.currentIndex
                                        ? ColorManager.primaryColor
                                        : ColorManager.blackColor
                                            .withOpacity(.5)),
                              ),
                            ),
                          ),
                        );
                      }),
                  SizedBox(
                    width: 200.w,
                    height: 60.h,
                    child: AppTextField(
                      hintText: StringsManager.searchText,
                      iconData: Icons.search,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: GetBuilder<NavbarController>(
                init: NavbarController(),
                builder: (context) {
                  return HeaderAppWidget(
                    name: 'Sarah',
                    title:
                        ConstManager.appBarPages[controller.currentIndex].name +
                            ' Page',
                  );
                }),
          ),
          SliverToBoxAdapter(
            child: GetBuilder<NavbarController>(
                init: NavbarController(),
                builder: (context) {
                  return ConstManager
                      .appBarPages[controller.currentIndex].screen;
                }),
          ),
          SliverToBoxAdapter(
            child: 40.h.height,
          ),
          SliverToBoxAdapter(child: FooterAppWidget())
        ],
      ),
    );
  }
}
