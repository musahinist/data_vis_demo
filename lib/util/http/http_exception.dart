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
          // switch (error.response?.data ?? '') {
          //   case "tokenNotFound":
          //     errorDescription = labels.exception.tokenNotFound;
          //     break;

          //   case "usernamePasswordFail":
          //     errorDescription =
          //         AppLocalization.getString("kUsernamePasswordFail");
          //     break;

          //   case "noPermission":
          //     errorDescription = AppLocalization.getString("kNoPermission");
          //     break;

          //   case "dataNotFound":
          //     errorDescription = AppLocalization.getString("kDataNotFound");
          //     break;

          //   case "pageNotFound":
          //     errorDescription = AppLocalization.getString("kPageNotFound");
          //     break;

          //   case "emailMustBeUnique":
          //     errorDescription =
          //         AppLocalization.getString("kEmailMustBeUnique");
          //     break;

          //   case "sessionNotFound":
          //     errorDescription = AppLocalization.getString("kSessionNotFound");
          //     break;

          //   case "invalidEmail":
          //     errorDescription = AppLocalization.getString("kInvalidEmail");
          //     break;

          //   case "emailNotNull":
          //     errorDescription = AppLocalization.getString("kEmailNotNull");
          //     break;

          //   case "surnameNotNull":
          //     errorDescription = AppLocalization.getString("kSurnameNotNull");
          //     break;

          //   case "nameNotNull":
          //     errorDescription = AppLocalization.getString("kNameNotNull");
          //     break;

          //   case "sizeExceed":
          //     errorDescription = AppLocalization.getString("kSizeExceed");
          //     break;

          //   case "birthDateNotNull":
          //     errorDescription = AppLocalization.getString("kBirthDateNotNull");
          //     break;

          //   default:
          //     errorDescription = AppLocalization.getString("kUnknownError");
          //     break;
          // }
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
