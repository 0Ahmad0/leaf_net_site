

import '../../../domain/services/api_service.dart';
import '../../../utils/app_url.dart';
import '../../models/base_model.dart';

class AttachmentRemoteDataSource {
  final ApiServices _apiServices;
  AttachmentRemoteDataSource( this._apiServices);

  // Future<String?> fetchAndCacheAttachment(String? id) async {
  //
  //   final response = await _apiServices.get(AppUrl.downloadAttachment,
  //       queryParams: {'Id':id??''},
  //       hasToken: true);
  //
  //   print(response);
  //   print('response remote');
  //   return response;
  // }
}
