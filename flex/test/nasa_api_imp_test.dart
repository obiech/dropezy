import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flex/domain/entity/error.dart';
import 'package:flex/domain/entity/image.dart';
import 'package:flex/infrastruture/repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:utils/utils.dart';

import 'helpers/mocks.dart';

void main() {
  group('NasaApiImpl', () {
    late ApiClient client;

    late NasaApiImpl api;
    setUp(() {
      client = MockDioClient();
      api = NasaApiImpl(client);
    });
    group('retrieve photos', () {
      test('makes correct request to endpoint', () async {
        Response response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.data).thenReturn(data);
        when(() => client.get(any()))
            .thenAnswer((invocation) async => response);
        expect(await api.retrieveImage(), isA<Right<AppError, List<Photo>>>());
        verify(() => api.retrieveImage()).called(1);
      });

      test('returns correct value on successful request', () async {
        Response response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.data).thenReturn(data);
        when(() => client.get(any()))
            .thenAnswer((invocation) async => response);

        expect(await api.retrieveImage(), isA<Right<AppError, List<Photo>>>());
      });
      test('returns correct value on AppException', () async {
        when(() => client.get(any())).thenThrow(const AppException(code: 500));
        expect(await api.retrieveImage(), isA<Left<AppError, List<Photo>>>());
      });
      test('handles unknown exception', () async {
        when(() => client.get(any())).thenThrow(Exception());
        expect(await api.retrieveImage(), isA<Left<AppError, List<Photo>>>());
      });
    });
  });
}

const data = [
  {'url': 'https://apod.nasa.gov/apod/image/1309/900px_201309110001HQ.jpg'}
];
