import 'package:flex/bloc/photo_bloc.dart';
import 'package:flex/domain/repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget, {PhotoBloc? photoBloc, NasaApi? repo}) {
    return pumpWidget(RepositoryProvider<NasaApi>(
        create: (context) => repo ?? MockNasaApiImpl(),
        child: BlocProvider.value(
          value: photoBloc ?? MockPhotoBloc(),
          child: MaterialApp(home: Scaffold(body: widget)),
        )));
  }
}
