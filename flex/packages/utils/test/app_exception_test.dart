import 'package:flutter_test/flutter_test.dart';
import 'package:utils/src/exceptions.dart';

void main() {
  group('AppException', () {
    test('supports creation of instances from construtors',
        () => expect(const AppException(), isA<AppException>()));
  });
}
