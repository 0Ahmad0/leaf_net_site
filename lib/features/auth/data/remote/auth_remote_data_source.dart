




import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/data/models/base_model.dart';
import '../../../../../../core/domain/services/api_service.dart';
import '../../../../../../core/utils/app_url.dart';
import '../../../../../core/data/datasource/storage/app_storage.dart';
import '../../../../core/data/models/user.dart';


class AuthRemoteDataSource  {
  final ApiServices _apiServices;

  AuthRemoteDataSource(this._apiServices);

  Future<BaseModel> login(String email, String password) async {


    final response = await _apiServices.post(
        AppUrl.login,
        body: {
          "username": email,
          "password": password,
        },
        hasToken: false);
    // final response = await _apiServices.reqHttp(null,
    //     AppUrl.login,
    //     body: {
    //       "email": email,
    //       "password": password,
    //     },
    //     hasToken: false);

    // final response={
    //   "user": {
    //     "id": 6,
    //     "username": "Rama_Re",
    //     "email": "syriarama377@gmail.com"
    //   },
    //   "token": "491b76c1dca962ee7d19362a7cc781e006df2448"
    // };
    response['message']??='login_successful';

    return BaseModel.fromJson(
      response,
          (json) => json as Map<String,dynamic>,
    );
  }

  Future<BaseModel> register(String email,String userName, String password,String? firstName, String? lastName) async {

    final response = await _apiServices.post(
        AppUrl.register,
        body: {
          "username": userName,
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "password": password,
        },
        hasToken: false);

    /// for test
    // final response={
    //   "user": {
    //     "id": 5,
    //     "username": "Rama_Re",
    //     "email": "syriarama377@gmail.com"
    //   },
    //   "message": "Account created successfully. A verification password has been sent to your email."
    // };
    response['message']??='register_successful';

    return BaseModel.fromJson(
      response,
          (json) =>  UserModel.fromJson(json['user']),
    );
  }

  Future<BaseModel> getProfile() async {

    final response = await _apiServices.get(
        AppUrl.getProfile,
        hasToken: true);

    // final response={
    //   "message": "Profile updated successfully.",
    //   "user": {
    //     "id": 4,
    //     "username": "Rama_Ree",
    //     "email": "syriarama377@gmail.com"
    //   }
    // };

    response['message']??='successful';

    return BaseModel.fromJson(
      response,
          (json) => UserModel.fromJson(json),
    );
  }

  Future<BaseModel> updateProfile(UserModel user,{XFile? userImage}) async {
    FormData formData=FormData.fromMap( user.toJson());

    if(userImage!=null)
      formData.files.add(
        MapEntry("profile_image", await MultipartFile.fromBytes((await userImage.readAsBytes()).toList()),
        // MapEntry("image", await MultipartFile.fromFile(userImage.patj??'',contentType:DioMediaType.parse('image/${path?.split('.').lastOrNull}'))),
      ));

    final response = await _apiServices.put(
        AppUrl.getProfile,
        formData:formData,
        hasToken: true);

    /// for test
    // final response={
    //   "message": "Profile updated successfully.",
    //   "user": {
    //     "id": 4,
    //     "username": "Rama_Ree",
    //     "email": "syriarama377@gmail.com"
    //   }
    // };

    response['message']??='successful';
    return BaseModel.fromJson(
      response,
          (json) => UserModel.fromJson(json['user']),
    );
  }

  Future<BaseModel> verifyEmail({String? email,String? code}) async {
    Map<String, dynamic>? body={};

    body={
      "email":email,
      "otp":code,

    };
    final response = await _apiServices.post(
        AppUrl.verifyEmail,
        body: body,
        hasToken: false
    );

    /// for test
    // final response={
    //   "message": "Account verified successfully!"
    // };
    response['message']??='verify_email_successful';
    return BaseModel.fromJson(
      response,
          (json) => json as Map<String,dynamic>,
    );
  }
  Future<BaseModel> verifyOtp({String? email,String? code}) async {
    Map<String, dynamic>? body={};

    body={
      "email":email,
      "otp":code,

    };
    final response = await _apiServices.post(
        AppUrl.verifyOtp,
        body: body,
        hasToken: false
    );

    /// for test
    // final response={
    //   "message": "Account verified successfully!"
    // };
    response['message']??='verify_email_successful';
    return BaseModel.fromJson(
      response,
          (json) => json as Map<String,dynamic>,
    );
  }




  Future<BaseModel> requestPasswordReset(String? email) async {
    Map<String, dynamic>? body={
      "email":email,
    };

    final response = await _apiServices.post(
        AppUrl.requestResetPassword,
        body:body,
        hasToken:false,
    );
    /// for test
    // final response={
    //   "message": "Verification code has been sent to your email."
    // };

    response['message']??='get_request_reset_password_successful';
    return BaseModel.fromJson(
      response,
          (json) => json as Map<String,dynamic>,
    );
  }

  Future<BaseModel> resendResetPasswordCode(String? email) async {
    Map<String, dynamic>? body={
      "email":email,
    };

    final response = await _apiServices.post(
        AppUrl.requestResetPassword,
        body:body
        );

    response['message']??='get_reset_password_info_successful';
    return BaseModel.fromJson(
      response,
          (json) => json as Map<String,dynamic>,
    );
  }


  Future<BaseModel> resetPassword({String? tempToken,String? newPassword}) async {
    Map<String, dynamic>? body={};

    body={
      // "email":email,
      // "code":code,
      "temp_token": tempToken,
      "new_password":newPassword,
    };
    final response = await _apiServices.post(
        AppUrl.requestResetPasswordWithToken,
        body: body,
        hasToken: false
    );

    /// for test
    // final response={
    //   "temp_token":"6:1tu6Vz:g1USw9DMaVzOcWQlmT4Gl_4xO3PEE14INLV-O1QFDOw",
    //   "new_password":"ramare@1128"
    // };
    response['message']??='reset_password_successful';
    return BaseModel.fromJson(
      response,
          (json) => json as Map<String,dynamic>,
    );
  }




  Future<BaseModel> logout() async {
    String? refreshToken= AppStorage.instance.readData(AppStorage.REFRESH_TOKEN);
    var body={"refresh":refreshToken};
    // final response = await _apiServices.post(AppUrl.logout,body:body, hasToken: true);

    return BaseModel(result: null, message: 'done_logout' );
  }




}
