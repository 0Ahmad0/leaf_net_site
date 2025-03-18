import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../../features/auth/data/remote/auth_remote_data_source.dart';
import '../../../../features/auth/domain/repositories/auth_repository.dart';
import '../../../../features/navbar/data/remote/diagnose_remote_data_source.dart';
import '../../../../features/navbar/domain/repositories/diagnose_repository.dart';
import '../../../domain/services/api_service.dart';
import '../../../domain/services/api_services_imp.dart';
import '../remote/attachment_remote_data_source.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<Dio>(() => Dio());
  locator.registerLazySingleton<ApiServices>(() => ApiServicesImp(locator()));
  locator.registerLazySingleton<AuthRepository>(() => AuthRepository(AuthRemoteDataSource(locator())));
  locator.registerLazySingleton<DiagnoseRepository>(() => DiagnoseRepository(DiagnoseDataSource(locator())));


}