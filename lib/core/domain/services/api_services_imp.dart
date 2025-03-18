import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/utils/app_url.dart';
import '../../data/datasource/storage/app_storage.dart';
import 'api_service.dart';

class ApiServicesImp implements ApiServices {
  final Dio _dio;
  late Map<String, dynamic> _headers;

  ApiServicesImp(this._dio) {
    _dio.options
      ..baseUrl = baseUrl
      ..responseType = ResponseType.plain
      ..sendTimeout =const Duration(minutes: 1)
      ..receiveTimeout = const Duration(minutes: 1)
      ..connectTimeout = const Duration(seconds: 30)

      ..followRedirects = true;
    _dio.interceptors.add(dioLoggerInterceptor);
  }

  Future<void> setHeaders(bool hasToken) async {
    _headers = {
      "Accept": "application/json",
      "accept-timezone":DateTime.now().timeZoneName,
      "Authorization":
          hasToken ? "Bearer ${( AppStorage.instance.readData(AppStorage.TOKEN))}" : null,
      // "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhaG1hZDEiLCJleHAiOjE2NzE4Nzc2MTMsImlhdCI6MTY3MTUxNzYxM30.ipa9KNJP2QhloBMtC0g0P0lwfGZlhGw9aWXQTC02G74":null,

    };

  }

  @override
  Future delete(String path,
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? body,
      bool? hasToken}) async {
    try {
      await setHeaders(hasToken ?? true);
      final response = await _dio.delete(
        path,
        queryParameters: queryParams,
        data: body,
        options: Options(headers: _headers),
      );
      return _handleResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future get(String path,
      {Map<String, dynamic>? queryParams, bool? hasToken}) async {
    try {
      await setHeaders(hasToken ?? true);
      final response = await _dio.get(
        path,
        queryParameters: queryParams,
        options: Options(headers: _headers),
      );
      return _handleResponseAsJson(response);
    } catch (error) {

      rethrow;
    }
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? body,
      FormData? formData,
      bool? hasToken}) async {
    try {
      await setHeaders(hasToken ?? true);

      final response = await _dio.post(
        path,
        queryParameters: queryParams,
        data: formData ?? body,
        options:
            Options(headers: _headers, contentType: Headers.jsonContentType),
      );

      return _handleResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future postFiles(BuildContext context, String path,
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? body,
      String? key,
      FormData? formData,
      bool? hasToken}) async {
    try {
      await setHeaders(hasToken ?? true);

      final response = await _dio.post(path,
          queryParameters: queryParams,
          data: formData ?? body,
          options:
              Options(headers: _headers, contentType: Headers.jsonContentType),
          onSendProgress: (sent, total) {
        if (total != -1) {

          var progress = (sent / total * 100).toStringAsFixed(0);
          // BlocProvider.of<UploadManagerCubit>(context)
          //     .uploadFile(key: key, progress: progress);
        }
      }, onReceiveProgress: (sent, total) {
        if (total != -1) {
          var progress = (sent / total * 100).toStringAsFixed(0);
          print('Download progress: $progress%');
        }
      });
      // BlocProvider.of<UploadManagerCubit>(context).completeUploadFile(key: key);
      return _handleResponseAsJson(response);
    } catch (error) {
      // BlocProvider.of<UploadManagerCubit>(context).failureUploadFile(key: key);
      rethrow;
    }
  }

  dynamic _handleResponseAsJson(Response response) {


    final responseAsJson = response.data.toString().isEmpty
        ? {}
        // :response.data.endsWith('}')&&response.data.startsWith('{')
        // ? jsonDecode(response.data.toString())
        : jsonDecode(response.data.toString());
        // :response.data;
    return responseAsJson;
    // final responseAsJson = response.data.toString().isEmpty
    //     ? {}
    //     : jsonDecode(response.data.toString());
    // return responseAsJson;
  }

  @override
  Future postList(String path,
      {Map<String, String>? queryParams,
      List? body,
      FormData? formData,
      bool? hasToken}) async {
    try {
      setHeaders(hasToken ?? true);
      final response = await _dio.post(
        path,
        queryParameters: queryParams,
        data: formData ?? body,
        options:
            Options(headers: _headers, contentType: Headers.jsonContentType),
      );
      return _handleResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? body,
      FormData? formData,
      bool? hasToken}) async {
    try {
      await setHeaders(hasToken ?? true);

      final response = await _dio.put(
        path,
        queryParameters: queryParams,
        data: formData ?? body,
        options:
            Options(headers: _headers, contentType: Headers.jsonContentType),
      );
      return _handleResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }

  final dioLoggerInterceptor =
  InterceptorsWrapper(onRequest: (RequestOptions options, handler) {

    // String headers = "";
    // options.headers.forEach((key, value) {
    //   headers += "| $key: $value";
    // });


    var data;

    if(options.data.runtimeType.toString()=='FormData')
      data={'fields':options.data?.fields,'files':options.data?.files};
    else
      data=options.data;
    String headers = "";
    options.headers.forEach((key, value) {
      headers += "| $key: $value";
    });
    log("┌------------------------------------------------------------------------------");
    log('''| [DIO] Request: ${options.method} ${options.uri}
| ${data}
| Headers:\n$headers''');
    log("├------------------------------------------------------------------------------");
    handler.next(options); //continue
  }, onResponse: (Response response, handler) async {
    // print(response.data);
    log(response.data.toString());
    log("└------------------------------------------------------------------------------");
    handler.next(response);
    // return response; // continue
  }, onError: (DioException error, handler) async {
    log("| [DIO] Error: ${error.error}: ${error.response.toString()}");
    log("└------------------------------------------------------------------------------");
    handler.next(error); //continue
  });
}
