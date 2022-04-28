import 'package:flex/domain/entity/image.dart';
import 'package:flex/view/preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/pump_app.dart';

void main() {
  group('Preview', () {
    const url =
        'https://apod.nasa.gov/apod/image/1309/900px_201309110001HQ.jpg';
    const Photo photo = Photo(url);
    testWidgets('renders preview', (tester) async {
      await tester.pumpApp(
        const Preview(
          photo: photo,
        ),
      );
      expect(
          find.byKey(const Key('network_image_for_preview')), findsOneWidget);
    });
  });
}
