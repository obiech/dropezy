import 'package:flex/bloc/photo_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PhotoEvent', () {
    group('RetrievePhotos', () {
      test('supports value comparisons', () {
        expect(const PhotoEvent.retrievePhotos(),
            equals(const PhotoEvent.retrievePhotos()));
      });
    });
  });
}
