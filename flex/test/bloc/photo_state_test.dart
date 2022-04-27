import 'package:flex/bloc/photo_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PhotoState', () {
    test('supports value comparisons', () {
      expect(PhotoState.initial(), equals(PhotoState.initial()));
      expect(const PhotoState(status: Status.failed, images: []),
          isNot(const PhotoState(status: Status.success, images: [])));
    });
  });
}
