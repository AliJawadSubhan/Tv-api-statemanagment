class AppExceptions implements Exception {
  final message;
  final prefix;
  AppExceptions([this.message, this.prefix]);

  String toString() {
    return '$prefix $message';
  }
}

class FetchDataExceptions extends AppExceptions {
  FetchDataExceptions([String? message])
      : super(message, 'Error During Communication!');
}

class BadRequestExcption extends AppExceptions {
  BadRequestExcption([String? message]) : super(message, 'Invalid request');
}

class UnAuthorizedException extends AppExceptions {
  UnAuthorizedException([String? message])
      : super(message, 'UnAuthorized Exception');
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message])
      : super(message, 'Invalid Input Exception');
}
