import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flex/bloc/photo_bloc.dart';
import 'package:flex/domain/entity/error.dart';
import 'package:flex/domain/entity/image.dart';
import 'package:flex/domain/repo.dart';
import 'package:flex/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/mocks.dart';
import '../helpers/pump_app.dart';

void main() {
  late NasaApi repo;
  late PhotoBloc bloc;
  late Storage hydratedStorage;

  const List<Photo> photoList = [Photo(''), Photo('')];
  PhotoState initialState = PhotoState.initial();

  group('Home View Page', () {
    hydratedStorage = MockStorage();
    repo = MockNasaApiImpl();
    PhotoBloc build() => HydratedBlocOverrides.runZoned(() => PhotoBloc(repo),
        storage: hydratedStorage);
    group('HomeView', () {
      testWidgets('renders HomeView', (tester) async {
        await tester.pumpApp(const HomeView(), photoBloc: build());
        expect(find.byKey(const Key('title')), findsOneWidget);
      });
    });

    group('Success State', () {
      setUp(() {
        bloc = MockPhotoBloc();
        when(() => bloc.state).thenReturn(
            initialState.copyWith(status: Status.success, images: []));
        when(() => repo.retrieveImage())
            .thenAnswer((invocation) async => const Right([]));
      });

      testWidgets('find list of Images', (tester) async {
        await tester.pumpApp(const HomeView(), repo: repo, photoBloc: bloc);
        expect(find.byType(ListView), findsOneWidget);
      });
      group('Loading state', () {
        setUp(() {
          bloc = MockPhotoBloc();
          when(() => bloc.state)
              .thenReturn(initialState.copyWith(status: Status.loading));
          when(() => repo.retrieveImage())
              .thenAnswer((invocation) async => const Right(photoList));
        });

        testWidgets('finding progress indicator', (tester) async {
          await tester.pumpApp(const HomeView(), repo: repo, photoBloc: bloc);
          expect(find.byKey(const Key('loading_indicator')), findsOneWidget);
        });
      });
      group('Error state', () {
        setUp(() {
          bloc = MockPhotoBloc();
          when(() => bloc.state).thenReturn(initialState.copyWith(
              status: Status.failed,
              error: const AppError(errMessage: 'fake')));
          when(() => repo.retrieveImage()).thenAnswer(
              (invocation) async => const Left(AppError(errMessage: 'fake')));
        });

        testWidgets('find error Message', (tester) async {
          await tester.pumpApp(const HomeView(), repo: repo, photoBloc: bloc);
          expect(find.byKey(const Key('error_widget')), findsOneWidget);
        });
      });
      group('renders correct widget on state change', () {
        setUp(() {
          bloc = MockPhotoBloc();
          when(() => bloc.state).thenReturn(initialState.copyWith(
            status: Status.loading,
          ));
          when(() => repo.retrieveImage())
              .thenAnswer((invocation) async => const Left(AppError()));
        });

        testWidgets('supports change from initial to loading state',
            (tester) async {
          whenListen(
            bloc,
            Stream.fromIterable([
              initialState,
              initialState.copyWith(status: Status.loading),
            ]),
          );

          await tester.pumpApp(const HomeView(), repo: repo, photoBloc: bloc);
          expect(find.byKey(const Key('loading_indicator')), findsOneWidget);
        });

        testWidgets('supports change from loading to success state',
            (tester) async {
          whenListen(
            bloc,
            Stream.fromIterable([
              initialState.copyWith(status: Status.loading),
              initialState.copyWith(status: Status.success),
            ]),
          );

          await tester.pumpApp(const HomeView(), repo: repo, photoBloc: bloc);
          await tester.pumpAndSettle();
          expect(find.byType(ListView), findsOneWidget);
        });
        testWidgets('supports change from loading to error state',
            (tester) async {
          whenListen(
            bloc,
            Stream.fromIterable([
              initialState.copyWith(status: Status.loading),
              initialState.copyWith(
                  status: Status.failed, error: const AppError()),
            ]),
          );

          await tester.pumpApp(const HomeView(), repo: repo, photoBloc: bloc);
          await tester.pumpAndSettle();
          expect(find.byKey(const Key('error_widget')), findsOneWidget);
          expect(find.byType(ProgressIndicator), findsNothing);
        });
      });
    });
  });
}
