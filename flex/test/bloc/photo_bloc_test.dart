import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flex/bloc/photo_bloc.dart';
import 'package:flex/domain/entity/error.dart';
import 'package:flex/domain/entity/image.dart';
import 'package:flex/domain/repo.dart';
import 'package:flex/infrastruture/photo_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/mocks.dart';

void main() {
  late NasaApi repo;
  final PhotoState initialState = PhotoState.initial();
  const List<Photo> photoList = [Photo('1'), Photo('2')];
  const AppError error = AppError();
  late Storage hydratedStorage;

  group('PhotoBloc', () {
    setUp(() {
      repo = MockNasaApi();
    });
    test('initial state is PuzzleState', () {
      expect(PhotoBloc(repo).state, initialState);
    });
  });
  group('PhotoBlocInitialized', () {
    setUp(() {
      repo = MockNasaApiImpl();
      hydratedStorage = MockStorage();
    });
    setUpAll(() {
      registerFallbackValue(MockStorage());
    });
    PhotoBloc build() => HydratedBlocOverrides.runZoned(() => PhotoBloc(repo),
        storage: hydratedStorage);
    blocTest<PhotoBloc, PhotoState>(
        'emits loading state when an event is added and successful '
        'status when repository fetches correct movies',
        setUp: () => when(() => repo.retrieveImage())
            .thenAnswer((invocation) async => const Right(photoList)),
        build: build,
        act: (bloc) => bloc.add(const PhotoEvent.retrievePhotos()),
        expect: () => [
              initialState.copyWith(status: Status.loading),
              initialState.copyWith(status: Status.success, images: photoList)
            ],
        verify: (_) => verify((() => repo.retrieveImage())).called(1));
        
    blocTest<PhotoBloc, PhotoState>(
        'emits loading state when an event is added '
        'emits failed status when repository fetches wrong movies',
        setUp: () {
          when(() => repo.retrieveImage())
              .thenAnswer((_) async => const Left(error));
        },
        build: build,
        act: (bloc) => bloc.add(const PhotoEvent.retrievePhotos()),
        expect: () => [
              initialState.copyWith(status: Status.loading),
              initialState.copyWith(status: Status.failed, error: error)
            ],
        verify: (_) => verify((() => repo.retrieveImage())).called(1));

    test(
        "does't supports conversion of states toJson when the status isn't successful",
        () {
      expect(
          build().toJson(initialState.copyWith(status: Status.failed)), isNull);
    });

    test("supports conversion of states toJson when the status is successful",
        () {
      expect(
          build().toJson(
              initialState.copyWith(status: Status.success, images: photoList)),
          equals({
            'images': ['1', '2']
          }));
    });

    test('supports conversion of map to states', () {
      expect(
          build().fromJson({
            'images': ['1', '2']
          }),
          equals(initialState.copyWith(
              status: Status.success,
              images: [const PhotoModel('1'), const PhotoModel('2')])));
    });
  });
}
