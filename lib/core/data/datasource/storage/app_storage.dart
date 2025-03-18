

import 'package:get_storage/get_storage.dart';


class AppStorage {
  static final AppStorage _instance = AppStorage._();

  static AppStorage get instance => _instance;


  AppStorage._() {
    init();
  }


   final box = GetStorage();
  ///Keys
  static const String TOKEN = 'access_token';
  static const String REFRESH_TOKEN_EXPIRE = 'refresh_token_expire_in_seconds';
  static const String REFRESH_TOKEN = 'refresh_token';
  static const String LOGIN_TIME = 'login_time';


   writeData(String key,dynamic value) async {
   await box.write(key, value);
  }
  writeDataAsync(String key,dynamic value){
    box.write(key, value).then((value) {
    });
  }

   String? readData(String key){
    String? result ;
    if(box.hasData(key)){
      result = box.read(key);

    }

    return result;
  }

   bool isReadData(String key){
    bool result = false;
    if(box.hasData(key)){
      result = box.read(key);
    }
    return result;
  }

   removeData(String key) async {
    if(box.hasData(key)) {
      await box.remove(key);
    }
  }
  removeDataAsync(String key){
    if(box.hasData(key)) {
      box.remove(key).then((value){
        // Get.snackbar('Success', 'Delete Key');
      });
    }
  }


  Future init() async {

  }

    depose() async {
     removeData(TOKEN);
     removeData(LOGIN_TIME);
     removeData(REFRESH_TOKEN);
     removeData(REFRESH_TOKEN_EXPIRE);

     // removeData(FIRST_TIME);

   }


}
