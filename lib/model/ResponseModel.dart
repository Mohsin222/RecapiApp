class ResponseModel<T> {
  final T? data;
  final String? error;

  ResponseModel._({this.data, this.error});

  // Factory constructor for a successful response
  factory ResponseModel.success(T data) {
    return ResponseModel._(data: data);
  }

  // Factory constructor for an error response
  factory ResponseModel.error(String error) {
    return ResponseModel._(error: error);
  }

  // Helper method to check if the response is successful
  bool get isSuccess => data != null;
}
