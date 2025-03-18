
import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../../../../core/data/datasource/remote/api_response.dart';
import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../../../core/data/models/user.dart';
import '../../data/remote/diagnose_remote_data_source.dart';

class DiagnoseRepository {
  final DiagnoseDataSource _remoteDataSource;

  DiagnoseRepository(this._remoteDataSource) ;

  Future<ApiResponse<BaseModel>> diagnose(XFile? image) async {
    try {
      final response = await _remoteDataSource.diagnose(image);

      return ApiResponse.success(response);
    } catch (error) {

      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }

}
