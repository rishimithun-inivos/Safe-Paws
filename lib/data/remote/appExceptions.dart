class AppException implements Exception{
 final dynamic _message;

 AppException([this._message]);

 String toString() {
   return '$_message';
 }
}

class FetchDataException extends AppException{
  FetchDataException([String? message])
  : super (
    'Internal Server Error',
    );
}

class UnauthorisedException extends AppException{
  UnauthorisedException([String? message])
      : super (
    'Access Denied',
  );
}

class InvalidRequestException extends AppException{
  InvalidRequestException([String? message])
      : super (
    'Invalid Credentials',
  );
}

class BadRequestException extends AppException{
  BadRequestException([String? message])
      : super (
    'Bad Request',
  );
}

class NotFoundException extends AppException{
  NotFoundException([String? message])
      : super (
    'Page Not Found',
  );
}