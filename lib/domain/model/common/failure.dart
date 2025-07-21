import 'package:distinct_assignment/core/utils/const.dart';

class Failure {
  String? message;
  dynamic data;

  Failure({this.message = errorMessage, this.data});

  factory Failure.fromDioError(json) {
    try {
      if (json == null) return Failure(message: errorMessage);
      return Failure(
          message: ((json as Map<String, dynamic>?)?['message'] as String?) ??
              errorMessage);
    } catch (e) {
      return Failure(message: errorMessage);
    }
  }
}
