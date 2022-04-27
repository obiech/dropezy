import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:mocktail/mocktail.dart';
import 'package:utils/src/api_client.dart';
import 'package:utils/src/dio_client.dart';

class MockApiClient<T> extends Mock implements ApiClient<T> {}

class MockResponse extends Mock implements Response {}

class MockDio extends Mock implements Dio {}

class MockDioClient extends Mock implements DioClient {}

class MockInterceptor extends Mock implements Interceptor {}
