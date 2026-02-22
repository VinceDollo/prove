class Result<T> {
  Result.success(this.data)
      : isSuccess = true,
        error = null;

  Result.error(this.error)
      : isSuccess = false,
        data = null;

  final T? data;
  final Exception? error;
  final bool isSuccess;
}
