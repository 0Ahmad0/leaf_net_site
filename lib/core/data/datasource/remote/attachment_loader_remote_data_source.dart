//
// import 'dart:convert';
// import 'dart:typed_data';
//
// import 'package:dio/dio.dart';
//
// import '../storage/app_storage.dart';
// import '../../../utils/app_url.dart';
// class AttachmentLoaderRemoteDataSource {
//   static final Dio _dio = Dio();
//   static final Map<String,dynamic> _cacheManager = {};
//
//
//   static Uint8List? fetchAndCacheImageAsync(String id)  {
//
//     return _cacheManager[id];
//
//   }
//   // Function to get the image
//   static Future<Uint8List?> fetchAndCacheImage(String id) async {
//
//     _dio.options
//       ..baseUrl = baseUrl
//       ..responseType = ResponseType.bytes
//       ..sendTimeout =const Duration(minutes: 1)
//       ..receiveTimeout = const Duration(minutes: 1)
//       ..connectTimeout = const Duration(seconds: 10)
//       ..followRedirects = true;
//     final url = AppUrl.downloadAttachment;
//
//
//     if (_cacheManager.containsKey(id) &&_cacheManager[id]!=null) {
//
//       return _cacheManager[id];
//     } else {
//       try {
//         // Fetch the image from the API
//         final response = await _dio.get(url,queryParameters:    {'Id':id??''},
//             options: Options(headers: {
//               // "Accept": "application/json",
//               "accept-timezone":DateTime.now().timeZoneName,
//               "Authorization":
//               true ? "Bearer ${( AppStorage.instance.readData(AppStorage.TOKEN))}" : null,
//             }));
//         if (response.statusCode == 200) {
//
//           Uint8List decodedBytes;
//           try {
//             decodedBytes=response.data;
//
//           } catch (e) {
//             print('Error decoding Base64: $e');
//             return null;
//           }
//           _cacheManager[id]=decodedBytes;
//
//           return decodedBytes;
//         }
//       } catch (e) {
//         print('Error fetching image: $e');
//       }
//     }
//
//     return null;
//   }
// }
// // class ImageLoader {
// //   static final Dio _dio = Dio();
// //   // static final BaseCacheManager _cacheManager = DefaultCacheManager();
// //   static final Map<String,dynamic> _cacheManager = {};
// //
// //   // Function to get the image
// //   static Future<Uint8List?> fetchAndCacheImage(String id) async {
// //
// //     _dio.options
// //       ..baseUrl = baseUrl
// //       ..responseType = ResponseType.bytes
// //       ..sendTimeout =const Duration(minutes: 1)
// //       ..receiveTimeout = const Duration(minutes: 1)
// //       ..connectTimeout = const Duration(seconds: 10)
// //       ..followRedirects = true;
// //     final url = AppUrl.downloadAttachment;
// //
// //     // Check if the image is already cached
// //     final fileInfo = await _cacheManager.getFileFromCache(id);
// //
// //     if (fileInfo != null&&false) {
// //       // Return the path to the cached file
// //       // return fileInfo.file.path;
// //     } else {
// //       try {
// //         // Fetch the image from the API
// //         final response = await _dio.get(url,queryParameters:    {'Id':id??''},
// //             options: Options(headers: {
// //               // "Accept": "application/json",
// //
// //               "accept-timezone":DateTime.now().timeZoneName,
// //               "Authorization":
// //               true ? "Bearer ${( AppStorage.instance.readData(AppStorage.TOKEN))}" : null,
// //               // "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhaG1hZDEiLCJleHAiOjE2NzE4Nzc2MTMsImlhdCI6MTY3MTUxNzYxM30.ipa9KNJP2QhloBMtC0g0P0lwfGZlhGw9aWXQTC02G74":null,
// //
// //             }));
// //         if (response.statusCode == 200) {
// //           // Assuming the response body is a base64 encoded string
// //           var imageData = response.data.toString();
// //           // var json={'d':imageData};
// //           // print('json $json');
// //           // print('Fetched image data: $imageData');
// //
// //           // Check and remove prefix if exists
// //           // if (imageData.startsWith('data:image')) {
// //           //   imageData = imageData.split(',')[1];
// //           // }
// //
// //
// //           // Decode base64 to byte array
// //           Uint8List decodedBytes;
// //
// //           try {
// //             decodedBytes=response.data;
// //
// //             // decodedBytes = base64Decode(imageData);
// //           } catch (e) {
// //             print('Error decoding Base64: $e');
// //             return null;
// //           }
// //           // // Decode base64 to byte array
// //           // final decodedBytes = base64Decode(imageData);
// //
// //           // Put the file in cache
// //           final cacheFile = await _cacheManager.putFile(
// //             id,
// //             decodedBytes,
// //             key: id,
// //             fileExtension: 'png', // Assuming the image is jpg, change if necessary
// //           );
// //
// //           // return cacheFile.path;
// //           return response.data;
// //         }
// //       } catch (e) {
// //         print('Error fetching image: $e');
// //       }
// //     }
// //
// //     return null;
// //   }
// // }