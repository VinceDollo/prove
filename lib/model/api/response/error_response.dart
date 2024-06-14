class ResponseException implements Exception {
  ResponseException(this.error);

  ResponseError error;
}

class ResponseError {
  ResponseError({this.error, this.errorDescription});

  ResponseError.fromJson(Map<String, dynamic> json) {
    error = json[errorKey] as String;
    errorDescription = json[errorDescriptionKey] as String;
  }

  static const errorKey = 'error';
  static const errorDescriptionKey = 'error_description';

  String? error;
  String? errorDescription;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[errorKey] = error;
    data[errorDescriptionKey] = errorDescription;
    return data;
  }
}
