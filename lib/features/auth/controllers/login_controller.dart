import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/data/datasource/configuration/locator.dart';
import '../../../core/data/datasource/storage/app_storage.dart';
import '../../../core/data/models/user.dart';
import '../../../core/dialogs/loading_dialog.dart';
import '../../../core/domain/error_handler/network_exceptions.dart';
import '../../../core/helper/response_helper.dart';
import '../../navbar/controllers/profile_controller.dart';
import '../../navbar/screens/home_screen.dart';
import '../../navbar/screens/navbar_screen.dart';
import '../../splash/splash_screen.dart';
import '../domain/repositories/auth_repository.dart';
import '../screens/login_screen.dart';

class LoginController extends GetxController{
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  late AuthRepository _repository;
  Map<String,dynamic>? result;
  @override
  void onInit() {
    _repository= locator<AuthRepository>();
    super.onInit();
  }

  Future<void> _saveUser(BuildContext context) async {

    Get.put(ProfileController()).updateUser(UserModel.fromJson(result?['user']));
    await AppStorage.instance.writeData(AppStorage.TOKEN, result?['token']);
    await AppStorage.instance.writeData(AppStorage.REFRESH_TOKEN_EXPIRE, result?['refreshTokenExpireInSeconds']);
    await AppStorage.instance.writeData(AppStorage.REFRESH_TOKEN, result?['refresh']);
    await AppStorage.instance.writeData(AppStorage.LOGIN_TIME, DateTime.now().toIso8601String());
  }

  Future<void> disposeUser(BuildContext context) async {
    await AppStorage.instance.removeData(AppStorage.TOKEN);
    await AppStorage.instance.removeData(AppStorage.LOGIN_TIME);
    await AppStorage.instance.removeData(AppStorage.REFRESH_TOKEN);
    await AppStorage.instance.removeData(AppStorage.REFRESH_TOKEN_EXPIRE);
    Get.offAll(() => SplashScreen(),
        transition: Transition.upToDown);

  }

  Future<void> login(BuildContext context,
      ) async {

    LoadingDialog.show(context);


    final response = await _repository.login(userNameController.text, passwordController.text);

    response.when(
      success: (data) async {
        result = data.result;


        await _saveUser(context);
        LoadingDialog.hide(context);
        ResponseHelper.onSuccess(context,message: data.message);

        // if(await context.read<UserCubit>().getProfile(context,isSplash: false)??false)
        // Get.offAll(() => HomeScreen());
        // else

        Get.offAll(
                () => NavbarScreen(),
            transition: Transition.topLevel
        );


      },
      failure: (networkException) {

        LoadingDialog.hide(context);

        ResponseHelper.onFailure(context,message: NetworkExceptions.getErrorMessage(networkException));

      },
    );
  }

  Future<void> logout(BuildContext context) async {

    LoadingDialog.show(context);

    final response = await _repository.logout();

    response.when(
      success: (data) async {
        LoadingDialog.hide(context);
        ResponseHelper.onSuccess(context,message: data.message);



        Get.put(ProfileController()).user=null;
        await disposeUser(context);

      },
      failure: (networkException) async {

        LoadingDialog.hide(context);

        ResponseHelper.onNetworkFailure(context,networkException:networkException);
        // LoadingDialog.hide(context);

      },
    );
  }

  @override
  void onClose() {
    userNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
