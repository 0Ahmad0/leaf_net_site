
import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../../../../core/data/datasource/remote/api_response.dart';
import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../../../core/data/models/user.dart';
import '../../data/remote/auth_remote_data_source.dart';

class AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepository(this._remoteDataSource) ;

  Future<ApiResponse<BaseModel>> login(String email, String password) async {
    try {
      final response = await _remoteDataSource.login(email, password);

      return ApiResponse.success(response);
    } catch (error) {

      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }
  Future<ApiResponse<BaseModel>> register(String email,String userName, String password,{String? firstName, String? lastName}) async {
    try {
      final response = await _remoteDataSource.register(email,userName, password,firstName,lastName);

      return ApiResponse.success(response);
    } catch (error) {

      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }


  Future<ApiResponse<BaseModel>> getProfile() async {
    try {
      final response = await _remoteDataSource.getProfile();

      return ApiResponse.success(response);
    } catch (error) {

      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }

  Future<ApiResponse<BaseModel>>  updateProfile(UserModel user,{XFile? userImage})  async {
    try {
      final response = await _remoteDataSource.updateProfile(user,userImage:userImage);

      return ApiResponse.success(response);
    } catch (error) {

      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }

  Future<ApiResponse<BaseModel>> verifyEmail({String? email,String? code})async {
    try {
      final response = await _remoteDataSource.verifyEmail(email: email,code: code);

      return ApiResponse.success(response);
    } catch (error) {

      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }

  Future<ApiResponse<BaseModel>> verifyOtp({String? email,String? code}) async {
    try {
      final response = await _remoteDataSource.verifyOtp(email: email,code: code);

      return ApiResponse.success(response);
    } catch (error) {

      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }








  Future<ApiResponse<BaseModel>> resetPassword({String? tempToken,String? newPassword}) async {
    try {
      final response = await _remoteDataSource.resetPassword(tempToken:tempToken,newPassword:newPassword);

      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }

  Future<ApiResponse<BaseModel>> requestPasswordReset(String? email) async {
    try {
      final response = await _remoteDataSource.requestPasswordReset(email);

      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }
  Future<ApiResponse<BaseModel>> resendResetPasswordCode(String? email)  async {
    try {
      final response = await _remoteDataSource.resendResetPasswordCode(email);

      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }



  Future<ApiResponse<BaseModel>> logout({String? accountType}) async {
    try {
      final response = await _remoteDataSource.logout();
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }

  // Future<ApiResponse<BaseModel>> getProfile() async {
  //   try {
  //     final response = await _remoteDataSource.getProfile();
  //     return ApiResponse.success(response);
  //   } catch (error) {
  //     return ApiResponse.failure(
  //       NetworkExceptions.getException(error),
  //     );
  //   }
  // }

}
