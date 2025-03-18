




import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/data/models/base_model.dart';
import '../../../../../../core/domain/services/api_service.dart';
import '../../../../../../core/utils/app_url.dart';
import '../../../../../core/data/datasource/storage/app_storage.dart';
import '../../../../core/data/models/user.dart';


class DiagnoseDataSource  {
  final ApiServices _apiServices;

  DiagnoseDataSource(this._apiServices);

  Future<BaseModel> diagnose(XFile? image) async {

    FormData formData=FormData();

    if(image!=null)
      formData.files.add(
          MapEntry("image", await MultipartFile.fromBytes((await image.readAsBytes()).toList(),filename: image.name),
            // MapEntry("FormFile", await MultipartFile.fromFile(userImage.patj??'',contentType:DioMediaType.parse('image/${path?.split('.').lastOrNull}'))),
          ));
    final response = await _apiServices.post(
        AppUrl.diagnoseUrl,
        formData: formData,
        hasToken: true);

    // final response={
    //   "plant_name": "Tomato",
    //   "disease": " Tomato YellowLeaf  Curl Virus",
    //   "confidence": 99.9233603477478,
    //   "treatment": "No specific treatment available. Consult an expert."
    // };
    response['message']??='diagnose_successful';

    return BaseModel.fromJson(
      response,
          (json) => json as Map<String,dynamic>,
    );
  }



}
