class Success<Response> {
  Success({required this.code, required this.response});

  int code;
  Response response;
}

class Failure<ErrorResponse> {
  Failure({this.code, this.errorResponse});

  int? code;
  ErrorResponse? errorResponse;
}
