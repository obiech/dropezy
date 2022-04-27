import 'package:flex/main.dart';
import 'package:flex/view/home.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders HomeView', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(HomeView), findsOneWidget);
    });
  });
}
