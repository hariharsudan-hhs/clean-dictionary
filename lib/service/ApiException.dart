class ApiException implements Exception {
  final _message;
  final _prefix;
  final _statusCode;
  ApiException([this._message, this._prefix, this._statusCode]);
  String toString() {
    return _statusCode.toString();
  }
}

class FetchDataException extends ApiException {
  FetchDataException([String? message, int? statusCode]) : super(message, "Error During Communication: ", statusCode);
}

class BadRequestException extends ApiException {
  BadRequestException([message, statusCode]) : super(message, "Invalid Request: ", statusCode);
}

class UnauthorisedException extends ApiException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends ApiException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
