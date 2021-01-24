import 'package:data_visualization/config/const/app_const.dart';
import 'package:data_visualization/util/log/dio_logger.dart';
import 'package:dio/dio.dart';

class HttpManager {
  HttpManager({this.tag, this.baseUrl}) {
    _dio.options..baseUrl = baseUrl ?? AppConst.baseUrl;

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        options.headers['Authorization'] = AppConst.authToken;

        DioLogger.onSend(tag, options);
        return options;
      },
      onResponse: (Response response) {
        DioLogger.onSuccess(tag, response);
        return response;
      },
      onError: (DioError error) {
        DioLogger.onError(tag, error);
        return error;
      },
    ));
  }

  final String tag;
  final String baseUrl;

  final Dio _dio = Dio();
  Dio get client => _dio;
}
