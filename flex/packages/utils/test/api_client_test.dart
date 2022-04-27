import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:utils/src/api_client.dart';
import 'package:utils/src/dio_client.dart';
import 'package:utils/src/exceptions.dart';

import 'mock.dart';

void main() {
  group('ApiClient', () {
    late ApiClient client;
    late Response response;
    setUp(() {
      client = DioClient(plugin: MockDio());
      response = MockResponse();
    });
    test("doesn't throw error if condition is true", () {
      expect(
          client.throwIfNot(
              response: () => response,
              condition: () => true,
              error: () => const AppException()),
          isA<MockResponse>());
    });
    test("throw error if condition is false", () {
      try {
        client.throwIfNot(
            response: () => response,
            condition: () => false,
            error: () => const AppException());
      } catch (e) {
        expect(e, isA<AppException>());
      }
    });
  });
}
