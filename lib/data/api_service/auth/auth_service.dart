import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:distinct_assignment/core/endpoints/api_endpoints.dart';
import 'package:distinct_assignment/data/api_service/api_service.dart';
import 'package:distinct_assignment/domain/model/api_response/api_response.dart';
import 'package:distinct_assignment/domain/model/auth/login_modal/login_modal.dart';
import 'package:distinct_assignment/domain/model/auth/token_model/token_model.dart';
import 'package:distinct_assignment/domain/repository/auth_repo.dart';
import 'package:distinct_assignment/secrets/secrets.dart';

class AuthService implements AuthRepo {
  final ApiService apiService = ApiService(ApiEndPoints.authBaseUrl);
  @override
  Future<ApiResponse> login({required LoginModal loginModel}) async {
    try {
      log('login -> ${loginModel.toJson()}');
      final responce = await apiService.post(
        ApiEndPoints.login,
        data: loginModel.toJson(),
        headers: {'x-api-key': AppSecrets.requResApiKey},
      );
      ApiResponse response = ApiResponse.fromJson(responce.data);
      response.data = TokenModel.fromJson(
        response.data as Map<String, dynamic>? ?? {},
      );
      log('login  -> ${response.toJson()}');
      return response;
    } on DioException catch (e) {
      log('login dio error -> $e');
      return ApiResponse.fromJson(e.response?.data);
    } catch (e) {
      log('login error -> $e');
      return ApiResponse.error();
    }
  }
}
