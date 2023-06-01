class AppExceptions implements Exception {
  final String? _message;
  final String? _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    // TODO: implement toString
    return "$_prefix $_message";
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, "Error during Communicating");
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, "Invalid request");
}

class UnAuthorisedException extends AppExceptions {
  UnAuthorisedException([String? message])
      : super(message, "UnAuthorised request");
}

class ServerBackendException extends AppExceptions {
  ServerBackendException([String? message])
      : super(message, "Server does not work properly");
}

class AppBackendException extends AppExceptions {
  AppBackendException([String? message]) : super(message, "App handling error");
}
