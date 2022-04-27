import 'package:flex/domain/entity/image.dart';
import 'package:flex/infrastruture/photo_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const PhotoModel fromDefaultConstrutor = PhotoModel('fakeUrl');
  final PhotoModel fromJsonConstrutor =
      PhotoModel.fromJson(const {'url': 'fakeUrl'});
  final PhotoModel fromValueConstrutor = PhotoModel.fromValue('fakeUrl');
  group('PhotoModel', () {
    group('construtors', () {
      test('supports creation of instance from default Construtor', () {
        expect(fromDefaultConstrutor, isA<PhotoModel>());
      });

      test('is a subtype of Photo class', () {
        expect(fromDefaultConstrutor, isA<Photo>());
      });
      test('supports creation of instance from fromJson Construtor', () {
        expect(fromJsonConstrutor, isA<PhotoModel>());
      });
      test('supports creation of instance from fromValue Construtor', () {
        expect(fromValueConstrutor, isA<PhotoModel>());
      });
    });

    test('supports conversion to Map', () {
      expect(fromDefaultConstrutor.toJson(), isA<Map>());
    });
  });
}
