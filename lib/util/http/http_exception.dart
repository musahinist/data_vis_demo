import 'package:dio/dio.dart';

class HttpException implements Exception {
  HttpException(
    this.response,
  );
  Response response;
  @override
  String toString() {
    return 'HttpException{response: $response}';
  }

  static String handleError(Exception error) {
    String errorDescription = '';
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.CANCEL:
          errorDescription = 'kRequestCanceled';
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = 'kConnectionTimeout';
          break;
        case DioErrorType.DEFAULT:
          errorDescription = 'kConnectionLost';
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          //We can apply error localizations instead of
          //   errorDescription = AppLocalization.getString("kReceiveTimeout");
          errorDescription = 'kReceiveTimeout';
          break;
        case DioErrorType.RESPONSE: //TODO Make them in enumaration
          errorDescription = error.response?.data as String ?? '';
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = "kCheckYourConnection";
          break;
      }
    } else {
      errorDescription = "kUnexpectedError";
    }
    return errorDescription;
  }
}
