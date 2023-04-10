class AppException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;
  AppException([this.message, this.prefix, this.url]);
}

class BadRequestException extends AppException {
  BadRequestException([String? message, String? prefix, String? url])
      : super(message, prefix ?? "Bad Request", url);
}

class FetchDataException extends AppException {
  FetchDataException([String? message, String? prefix, String? url])
      : super(message, prefix ?? "Unable To Process", url);
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException([String? message, String? prefix, String? url])
      : super(message, prefix ?? "Api Not Responding", url);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message, String? prefix, String? url])
      : super(message, prefix ?? "UnAuthorized", url);
}
// class BadRequestException extends AppException { //to add more such
//   BadRequestException([String? message, String? prefix, String? url])
//       : super(message, "Bad Request", url);
     
// }

