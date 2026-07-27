import 'package:flutter_test/flutter_test.dart';
import 'package:modulo12_api_mp/main.dart';

void main() {
  testWidgets('Smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const AppHttp());
  });
}
