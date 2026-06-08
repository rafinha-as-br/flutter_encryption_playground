import 'package:encryption_playground/app/app_bootstrap.dart';
import 'package:encryption_playground/app/app_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PackageInfo.setMockInitialValues(
      appName: 'Encryption Playground',
      packageName: 'com.example.encryption_playground',
      version: '1.0.0',
      buildNumber: '1',
      buildSignature: '',
    );
  });

  testWidgets('App starts and shows Onboarding Page on first launch', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await AppInjector.init();

    await tester.pumpWidget(const AppBootstrap());
    await tester.pumpAndSettle();

    // Verify that the PageView for onboarding is present
    expect(find.byType(PageView), findsOneWidget);
    
    // Check for onboarding specific icons to confirm we are on the Onboarding Page
    expect(find.byIcon(Icons.waving_hand_outlined), findsOneWidget);
  });

  testWidgets('App starts and shows Home Page when onboarding is completed', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({
      'onboarding_completed': true,
    });
    await AppInjector.init();

    await tester.pumpWidget(const AppBootstrap());
    await tester.pumpAndSettle();

    // Verify that the app title is present
    expect(find.text('Encryption Playground'), findsWidgets);
    
    // Verify that side menu or dashboard specific texts are present
    expect(find.text('Caesar'), findsWidgets);
    expect(find.text('Diffie-Hellman'), findsWidgets);
    expect(find.text('Hash'), findsWidgets);
  });
}
