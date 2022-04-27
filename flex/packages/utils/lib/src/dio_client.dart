import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:utils/src/api_client.dart';
import 'package:utils/src/exceptions.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

class DioClient extends ApiClient<Response> {
  @visibleForTesting
  @protected
  final Dio plugin;

  DioClient({required this.plugin});

  @override
  Future<Response> get(
    String endpoint,
  ) async {
    // plugin.interceptors.add(RetryInterceptor(
    //     dio: plugin,
    //     logPrint: print,
    //     retries: 3,
    //     retryDelays: const [
    //       Duration(seconds: 1),
    //       Duration(seconds: 2),
    //       Duration(seconds: 3)
    //     ]));
    Response response = await plugin.get(endpoint);
    return throwIfNot(
        response: () => response,
        condition: () => (response.statusCode == 200),
        error: () => AppException(
            code: response.statusCode, err: response.statusMessage));
  }
}
