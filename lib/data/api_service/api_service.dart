// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:get/get.dart' as getx;
// // ignore: depend_on_referenced_packages
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// @injectable
// class ApiService {
//   final Dio _dio;

//   ApiService(this._dio) {
//     _dio.options = BaseOptions(baseUrl: ApiEndPoints.baseUrl);
//     assert(() {
//       _dio.interceptors.add(
//         PrettyDioLogger(
//           requestHeader: true,
//           requestBody: true,
//           responseBody: true,
//           responseHeader: false,
//           error: true,
//           compact: true,
//           maxWidth: 100,
//         ),
//       );
//       return true;
//     }());
//   }

//   Future<ApiResponse> get(
//     String url, {
//     Map<String, dynamic>? queryParameters,
//     Map<String, dynamic>? headers,
//     Map<String, dynamic>? data,
//     bool addHeader = true,
//   }) async {
//     try {
//       if (addHeader) {
//         final accessToken =
//             await SharedPref.getToken().then((token) => token.accessToken);
//         _dio.options.headers.addAll(
//           {
//             'authorization': "Bearer $accessToken",
//             ...headers ?? {'content-Type': 'application/json'}
//           },
//         );
//       } else {
//         _dio.options.headers['content-Type'] = 'application/json';
//       }
//       final response =
//           await _dio.get(url, data: data, queryParameters: queryParameters);
//       return ApiResponse.fromJson(response.data);
//     } on DioException catch (exception) {
//       if (exception.response?.statusCode == 401) {
//         await _refreshAccessToken();
//         return _retry(exception.requestOptions);
//       }
//       return ApiResponse.error(
//           exception.response?.data, exception.response?.statusCode);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<ApiResponse> post(
//     String url, {
//     Map<String, dynamic>? queryParameters,
//     Map<String, dynamic>? headers,
//     dynamic data,
//     bool addHeader = true,
//   }) async {
//     try {
//       if (addHeader) {
//         final accessToken =
//             await SharedPref.getToken().then((token) => token.accessToken);
//         _dio.options.headers.addAll(
//           {
//             'authorization': "Bearer $accessToken",
//             ...headers ?? {'content-Type': 'application/json'}
//           },
//         );
//       } else {
//         _dio.options.headers['content-Type'] = 'application/json';
//       }

//       final response = await _dio.post(
//         url,
//         data: data is FormData ? data : data as Map<String, dynamic>?,
//         queryParameters: queryParameters,
//       );
//       return ApiResponse.fromJson(response.data);
//     } on DioException catch (exception) {
//       if (exception.response?.statusCode == 401) {
//         await _refreshAccessToken();
//         return _retry(exception.requestOptions);
//       }
//       return ApiResponse.error(
//           exception.response?.data, exception.response?.statusCode);
//     } catch (e) {
//       log('Exception => $e');
//       rethrow;
//     }
//   }

//   Future<ApiResponse> put(
//     String url, {
//     Map<String, dynamic>? queryParameters,
//     Map<String, dynamic>? headers,
//     dynamic data,
//     bool addHeader = true,
//   }) async {
//     try {
//       if (addHeader) {
//         final accessToken =
//             await SharedPref.getToken().then((token) => token.accessToken);
//         _dio.options.headers.addAll(
//           {
//             'authorization': "Bearer $accessToken",
//             ...headers ?? {'content-Type': 'application/json'}
//           },
//         );
//       } else {
//         _dio.options.headers['content-Type'] = 'application/json';
//       }

//       final response = await _dio.put(url,
//           data: data is FormData ? data : data as Map<String, dynamic>?,
//           queryParameters: queryParameters);
//       return ApiResponse.fromJson(response.data);
//     } on DioException catch (exception) {
//       if (exception.response?.statusCode == 401) {
//         await _refreshAccessToken();
//         return _retry(exception.requestOptions);
//       }
//       return ApiResponse.error(
//           exception.response?.data, exception.response?.statusCode);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<ApiResponse> delete(
//     String url, {
//     Map<String, dynamic>? queryParameters,
//     Map<String, dynamic>? headers,
//     Map<String, dynamic>? data,
//     bool addHeader = true,
//   }) async {
//     try {
//       if (addHeader) {
//         final accessToken =
//             await SharedPref.getToken().then((token) => token.accessToken);
//         _dio.options.headers.addAll(
//           {
//             'authorization': "Bearer $accessToken",
//             ...headers ?? {'content-Type': 'application/json'}
//           },
//         );
//       } else {
//         _dio.options.headers['content-Type'] = 'application/json';
//       }

//       final response =
//           await _dio.delete(url, data: data, queryParameters: queryParameters);
//       return ApiResponse.fromJson(response.data);
//     } on DioException catch (exception) {
//       if (exception.response?.statusCode == 401) {
//         await _refreshAccessToken();
//         return _retry(exception.requestOptions);
//       }
//       return ApiResponse.error(
//           exception.response?.data, exception.response?.statusCode);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<ApiResponse> patch(
//     String url, {
//     Map<String, dynamic>? queryParameters,
//     Map<String, dynamic>? headers,
//     Map<String, dynamic>? data,
//     bool addHeader = true,
//   }) async {
//     try {
//       if (addHeader) {
//         final accessToken =
//             await SharedPref.getToken().then((token) => token.accessToken);
//         _dio.options.headers.addAll(
//           {
//             'authorization': "Bearer $accessToken",
//             ...headers ?? {'content-Type': 'application/json'}
//           },
//         );
//       } else {
//         _dio.options.headers['content-Type'] = 'application/json';
//       }

//       final response =
//           await _dio.patch(url, data: data, queryParameters: queryParameters);
//       return ApiResponse.fromJson(response.data);
//     } on DioException catch (exception) {
//       if (exception.response?.statusCode == 401) {
//         await _refreshAccessToken();
//         return _retry(exception.requestOptions);
//       }
//       return ApiResponse.error(
//           exception.response?.data, exception.response?.statusCode);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   void _logOut() {
//     SharedPref.clearLogin();
//     getx.Get.offAllNamed(Routes.initial);
//   }

//   _refreshAccessToken() async {
//     try {
//       final token =
//           await SharedPref.getToken().then((token) => token.refreshToken);
//       final response = await Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl))
//           .put(ApiEndPoints.refreshUrl, data: {'refreshToken': token});
//       final data = ApiResponse.fromJson(response.data);
//       final model =
//           LoginResponseModel.fromJson(data.data as Map<String, dynamic>);
//       await SharedPref.saveTokens(tokenModel: model);
//       getx.Get.find<RoleController>().getApproalStatus();
//     } on DioException catch (exception) {
//       log('_refresh error => $exception');
//       _logOut();
//       rethrow;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<ApiResponse> _retry(RequestOptions requestOptions) async {
//     try {
//       final accessToken =
//           await SharedPref.getToken().then((token) => token.accessToken);
//       _dio.options.headers['authorization'] = "Bearer $accessToken";
//       final result = await _dio.request(requestOptions.path,
//           queryParameters: requestOptions.queryParameters,
//           data: requestOptions.data);
//       return ApiResponse.fromJson(result.data);
//     } on DioException catch (exception) {
//       return ApiResponse.error(
//           exception.response?.data, exception.response?.statusCode);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   // Download file from URL to a provided path
//   Future<bool> downloadFile({
//     required String url,
//     required String savePath,
//     Function(int received, int total)? onReceiveProgress,
//   }) async {
//     try {
//       await _dio.download(
//         url,
//         savePath,
//         onReceiveProgress: onReceiveProgress,
//       );
//       return true;
//     } catch (e) {
//       log('Error downloading file: $e');
//       return false;
//     }
//   }
// }