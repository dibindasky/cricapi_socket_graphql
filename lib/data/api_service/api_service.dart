import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:distinct_assignment/core/routes/routes.dart';
import 'package:distinct_assignment/data/local_storage_service/local_storage_pref_service.dart';
import 'package:distinct_assignment/domain/model/api_response/api_response.dart';
import 'package:get/get.dart' as getx;
// ignore: depend_on_referenced_packages
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl;

  ApiService(this._baseUrl) {
    _dio.options = BaseOptions(baseUrl: _baseUrl);
    assert(() {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 100,
        ),
      );
      return true;
    }());
  }

  Future<ApiResponse> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    bool addToken = false,
  }) async {
    try {
      if (addToken) {
        final accessToken = await LocalStoragePrefService.getToken().then(
          (token) => token.token,
        );
        _dio.options.headers.addAll({
          'authorization': "Bearer $accessToken",
          ...headers ?? {'content-Type': 'application/json'},
        });
      } else {
        _dio.options.headers['content-Type'] = 'application/json';
      }
      final response = await _dio.get(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return ApiResponse.fromJson(response.data);
    } on DioException catch (exception) {
      if (exception.response?.statusCode == 401) {
        await _refreshAccessToken();
        return _retry(exception.requestOptions);
      }
      return ApiResponse.error(
        exception.response?.data,
        exception.response?.statusCode,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> post(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic data,
    bool addToken = false,
  }) async {
    try {
      if (addToken) {
        final accessToken = await LocalStoragePrefService.getToken().then(
          (token) => token.token,
        );
        _dio.options.headers.addAll({
          'authorization': "Bearer $accessToken",
          ...headers ?? {'content-Type': 'application/json'},
        });
      } else {
        _dio.options.headers['content-Type'] = 'application/json';
      }
      if (headers != null) {
        _dio.options.headers.addAll(headers);
      }

      final response = await _dio.post(
        url,
        data: data is FormData ? data : data as Map<String, dynamic>?,
        queryParameters: queryParameters,
      );
      return ApiResponse.fromJson(response.data);
    } on DioException catch (exception) {
      if (exception.response?.statusCode == 401) {
        await _refreshAccessToken();
        return _retry(exception.requestOptions);
      }
      return ApiResponse.error(
        exception.response?.data,
        exception.response?.statusCode,
      );
    } catch (e) {
      log('Exception => $e');
      rethrow;
    }
  }

  Future<ApiResponse> put(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic data,
    bool addToken = false,
  }) async {
    try {
      if (addToken) {
        final accessToken = await LocalStoragePrefService.getToken().then(
          (token) => token.token,
        );
        _dio.options.headers.addAll({
          'authorization': "Bearer $accessToken",
          ...headers ?? {'content-Type': 'application/json'},
        });
      } else {
        _dio.options.headers['content-Type'] = 'application/json';
      }

      final response = await _dio.put(
        url,
        data: data is FormData ? data : data as Map<String, dynamic>?,
        queryParameters: queryParameters,
      );
      return ApiResponse.fromJson(response.data);
    } on DioException catch (exception) {
      if (exception.response?.statusCode == 401) {
        await _refreshAccessToken();
        return _retry(exception.requestOptions);
      }
      return ApiResponse.error(
        exception.response?.data,
        exception.response?.statusCode,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> delete(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    bool addToken = false,
  }) async {
    try {
      if (addToken) {
        final accessToken = await LocalStoragePrefService.getToken().then(
          (token) => token.token,
        );
        _dio.options.headers.addAll({
          'authorization': "Bearer $accessToken",
          ...headers ?? {'content-Type': 'application/json'},
        });
      } else {
        _dio.options.headers['content-Type'] = 'application/json';
      }

      final response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return ApiResponse.fromJson(response.data);
    } on DioException catch (exception) {
      if (exception.response?.statusCode == 401) {
        await _refreshAccessToken();
        return _retry(exception.requestOptions);
      }
      return ApiResponse.error(
        exception.response?.data,
        exception.response?.statusCode,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> patch(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    bool addToken = false,
  }) async {
    try {
      if (addToken) {
        final accessToken = await LocalStoragePrefService.getToken().then(
          (token) => token.token,
        );
        _dio.options.headers.addAll({
          'authorization': "Bearer $accessToken",
          ...headers ?? {'content-Type': 'application/json'},
        });
      } else {
        _dio.options.headers['content-Type'] = 'application/json';
      }

      final response = await _dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return ApiResponse.fromJson(response.data);
    } on DioException catch (exception) {
      if (exception.response?.statusCode == 401) {
        await _refreshAccessToken();
        return _retry(exception.requestOptions);
      }
      return ApiResponse.error(
        exception.response?.data,
        exception.response?.statusCode,
      );
    } catch (e) {
      rethrow;
    }
  }

  void _logOut() {
    LocalStoragePrefService.clearLogin();
    getx.Get.offAllNamed(Routes.initial);
  }

  _refreshAccessToken() async {
    try {
      // refresh token logic
    } on DioException catch (exception) {
      log('_refresh error => $exception');
      _logOut();
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> _retry(RequestOptions requestOptions) async {
    try {
      final accessToken = await LocalStoragePrefService.getToken().then(
        (token) => token.token,
      );
      _dio.options.headers['authorization'] = "Bearer $accessToken";
      final result = await _dio.request(
        requestOptions.path,
        queryParameters: requestOptions.queryParameters,
        data: requestOptions.data,
      );
      return ApiResponse.fromJson(result.data);
    } on DioException catch (exception) {
      return ApiResponse.error(
        exception.response?.data,
        exception.response?.statusCode,
      );
    } catch (e) {
      rethrow;
    }
  }

  // Download file from URL to a provided path
  Future<bool> downloadFile({
    required String url,
    required String savePath,
    Function(int received, int total)? onReceiveProgress,
  }) async {
    try {
      await _dio.download(url, savePath, onReceiveProgress: onReceiveProgress);
      return true;
    } catch (e) {
      log('Error downloading file: $e');
      return false;
    }
  }
}
