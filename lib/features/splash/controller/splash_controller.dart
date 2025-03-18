import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/data/datasource/configuration/data_configuration.dart';
import '../../../core/data/datasource/storage/app_storage.dart';
import '../../auth/screens/login_screen.dart';
import '../../navbar/controllers/profile_controller.dart';


class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // static SplashController  get instance => Get.find();
  int delaySplash = 1;

  @override
  Future<void> onInit() async {
    // await initSplash();
    super.onInit();
  }

  Future<void> _loadSplash(BuildContext context)  async {
    await AppStorage.instance.init();

    if(AppStorage.instance.readData(AppStorage.TOKEN)!=null) {
      ProfileController profileController = Get.put(ProfileController());

      await profileController.getProfile(context);
    } else
      await Future.delayed( const Duration(seconds: 2), () {
        Get.offAll(
                () => LoginScreen(),
            transition: Transition.fadeIn
        );
      });

  }
  Future<void> _initSplash(BuildContext context) async {
    await AppStorage.instance.init();
    await initDataConfiguration();

  }
  Future<void> initSplash(BuildContext context) async {
    await _initSplash(context);
    await _loadSplash(context);
  }


}
