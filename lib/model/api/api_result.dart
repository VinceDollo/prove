import 'package:flutter_starter/model/api/api_error.dart';

class ApiResult<T extends Object?> {
  ApiResult.success(this.data)
      : isSuccess = true,
        error = null;

  ApiResult.error(Exception this.error)
      : isSuccess = false,
        data = null;

  final bool isSuccess;
  final T? data;
  final Exception? error;

  String getErrorMessage(String defaultMessage) {
    if (error is ApiError) {
      return (error! as ApiError).message ?? defaultMessage;
    }
    return defaultMessage;
  }
}
