import 'package:flex/domain/entity/error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:utils/utils.dart';

void main() {
  group('Error model', () {
    group('construtors', (() {
      test('supports creation of instance from construtors', () {
        expect(const AppError(), isA<AppError>());
      });
      test('supports creation of instance from fromCode construtors', () {
        expect(AppError.fromCode(const AppException()), isA<AppError>());
      });
    }));
    test('supports comparising', () {
      expect(const AppError(errMessage: 'fakeMessage'),
          equals(const AppError(errMessage: 'fakeMessage')));
      expect(const AppError(errMessage: 'fakeMessage'),
          isNot(const AppError(errMessage: '')));
    });
  });
}
