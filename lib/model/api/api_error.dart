class ApiError implements Exception {
  ApiError({
    this.message,
    this.code,
  });

  ApiError.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    code = json['code'] as int?;
  }

  String? message;
  int? code;
}
