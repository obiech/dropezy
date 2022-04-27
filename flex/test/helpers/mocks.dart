import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flex/bloc/photo_bloc.dart';
import 'package:flex/domain/repo.dart';
import 'package:flex/infrastruture/repo.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:utils/utils.dart';

class MockPhotoBloc extends MockBloc<PhotoEvent, PhotoState>
    implements PhotoBloc {}

class MockNasaApi extends Mock implements NasaApi {}

class MockApiClient extends Mock implements ApiClient {}

class MockNasaApiImpl extends Mock implements NasaApiImpl {}

class MockResponse extends Mock implements Response {}

class FakeUri extends Fake implements Uri {}

class MockPhotoState extends Mock implements PhotoState {}

class MockStorage extends Mock implements Storage {
  @override
  Future<void> write(String key, dynamic value) async {}
}

class MockDioClient extends Mock implements DioClient{}