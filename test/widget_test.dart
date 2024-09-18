import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';
import 'package:myapp/screens/splash_screen.dart';
import 'package:myapp/screens/home_page.dart';

void main() {
  testWidgets('SplashScreen appears and navigates to HomePage', (WidgetTester tester) async {
    await tester.pumpWidget(NatureGalleryApp());

    expect(find.byType(SplashScreen), findsOneWidget);
    expect(find.text('Nature Gallery'), findsOneWidget); 
    expect(find.byIcon(Icons.nature), findsOneWidget);    

    await tester.pumpAndSettle(const Duration(seconds: 3));

    expect(find.byType(HomePage), findsOneWidget);
    expect(find.text('Nature Gallery'), findsOneWidget); 
  });

  testWidgets('HomePage shows search bar and image grid', (WidgetTester tester) async {

    await tester.pumpWidget(NatureGalleryApp());
    await tester.pumpAndSettle(const Duration(seconds: 3));  

    expect(find.byType(TextField), findsOneWidget);           
    expect(find.byType(GridView), findsOneWidget);            
  });
}
