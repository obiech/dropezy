import 'package:cinephile/infrastructure/core/constant.dart';
import 'package:dio/dio.dart';

class Client {
  final Dio _dio = Dio();

  dynamic get() async {
    var params = {
      "api_key": Constant.apiKey,
      "language": "en-US",
      "query": "dancing",
      "page": 1,
      "size": "small",
      "orientation ": "portrait"
    };
    
    
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      options.headers["Authorization"] = Constant.apiKey;
      _dio.interceptors.requestLock.unlock();
      return handler.next(options);
    }));
    Response response =
        await _dio.get(Constant.relavent, queryParameters: params);
    return response;
  }
}
