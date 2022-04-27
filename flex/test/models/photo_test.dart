import 'package:flex/domain/entity/image.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Photo', () {
    test('supports value comparison', (() {
      expect(const Photo('1'), equals(const Photo('1')));
      expect(const Photo('1'), isNot(const Photo('2')));
    }));

    test('supports creation of instance from construtor', () {
      expect(const Photo('1'), isA<Photo>());
    });
  });
}











// void main() {
//   group('Movie', () {
//     test('only compares id, title and body', () {
//       expect(
//         const DetailedMovie(
//           id: 1,
//           title: 'post title',
//           body: 'post body',
//           image: 'abc',
//         ),
//         const DetailedMovie(
//           id: 1,
//           title: 'post title',
//           body: 'post body',
//           image: 'dfg',
//         ),
//       );
//     });
//   });
// }