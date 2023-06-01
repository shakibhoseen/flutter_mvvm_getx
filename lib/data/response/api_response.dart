import 'package:flutter_mvvm_getx/data/response/status.dart';

class ApiResponse<T> {
  String? message;
  T? data;
  Status? status;

  ApiResponse(this.message, this.data, this.status);

  ApiResponse.isLoading() : status = Status.loading;
  ApiResponse.completed(this.data) : status = Status.completed;
  ApiResponse.error(this.message) : status = Status.error;

  @override
  String toString() {
    // TODO: implement toString
    return "Status $status\n Message $message\n Data $data ";
  }
}
