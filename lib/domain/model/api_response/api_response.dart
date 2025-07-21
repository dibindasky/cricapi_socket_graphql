import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse {
  bool? success;
  String? message;
  dynamic data;
  dynamic error;
  int? statusCode;

  ApiResponse({
    this.success,
    this.message,
    this.data,
    this.error,
    this.statusCode,
  });

  factory ApiResponse.fromJson(Map<String, dynamic>? json) {
    try {
      if (json == null) return ApiResponse.error();
      return ApiResponse(
        success:
            (json['success'] as bool?) ??
            (json['error'] != null ? false : true),
        message: json['message'] as String?,
        data: json['data'] ?? json,
        error: json['error'],
        statusCode: (json['statusCode'] as num?)?.toInt(),
      );
    } catch (e) {
      return ApiResponse.error(json);
    }
  }

  factory ApiResponse.error([Map<String, dynamic>? json, int? statusCode]) =>
      ApiResponse(
        data: json,
        statusCode: statusCode ?? (json?['statusCode'] as num?)?.toInt(),
        message:
            (json?['error'] as String?) ??
            (json?['message'] as String?) ??
            'Something went wrong',
        success: false,
      );

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);

  ApiResponse copyWith({
    bool? success,
    String? message,
    dynamic data,
    dynamic error,
    int? statusCode,
  }) {
    return ApiResponse(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
      error: error ?? this.error,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}
