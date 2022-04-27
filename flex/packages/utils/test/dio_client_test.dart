import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:utils/src/dio_client.dart';
import 'package:utils/src/exceptions.dart';

import 'mock.dart';

void main() {
  group('DioClient', (() {
    late Dio dio = MockDio();
    late Response response;
    late DioClient dioClient;
    setUp(() {
      // dio.interceptors.add(MockInterceptor(dio: dio, retries: 3));
      dioClient = DioClient(plugin: dio);
      response = MockResponse();
      // dio.interceptors.add(RetryInterceptor(dio: Dio()));
      // when(() => dio.interceptors.add(MockInterceptor()))
      //     .thenReturn(MockInterceptor());
      when(() => dio.get(any())).thenAnswer((invocation) async => response);
    });
    setUpAll(() {
      registerFallbackValue(MockDioClient());
      registerFallbackValue(MockDio());
      registerFallbackValue(MockResponse());
    });

    test('returns value on 200 status code', () async {
      when(() => response.statusCode).thenReturn(200);
      expect(await dioClient.get(''), response);
    });

    test('throws exception on non 200 status code', () async {
      when(() => response.statusCode).thenReturn(400);
      try {
        await dioClient.get('');
      } catch (e) {
        expect(e, isA<AppException>());
      }
    });
    // group('description', () {
    //   setUp(() {
    //     dioClient = DioClient(plugin: dio);
    //     response = MockResponse();
    //     when(() => dio.get(any())).thenAnswer((invocation) async => response);
    //   });
    //   test('', () {
    //           when(() => response.statusCode).thenReturn(400);
    //           try {
    //     await dioClient.get('');

    //           } catch (e) {

    //           }
    //   });
    // });
  }));
}
