import 'package:distinct_assignment/domain/model/api_response/api_response.dart';
import 'package:distinct_assignment/domain/model/auth/login_modal/login_modal.dart';

abstract class AuthRepo {
  Future<ApiResponse> login({required LoginModal loginModel});
}
