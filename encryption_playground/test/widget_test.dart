import 'package:encryption_playground/app/app_bootstrap.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App starts and shows Home Page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AppBootstrap());

    // Verify that the title is present
    expect(find.text('Encryption Playground'), findsOneWidget);
    
    // Verify that tabs are present
    expect(find.text('Caesar'), findsOneWidget);
    expect(find.text('Diffie-Hellman'), findsOneWidget);
    expect(find.text('Hash'), findsOneWidget);
  });
}
