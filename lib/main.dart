import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_page.dart';
import 'screens/detail_page.dart';

void main() {
  runApp(const NatureGalleryApp());
}

class NatureGalleryApp extends StatelessWidget {
  const NatureGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nature Gallery',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: SplashScreen(),
      routes: {
        '/home': (context) => const HomePage(),
    '/detail': (context) {
      final imageUrl = ModalRoute.of(context)!.settings.arguments as String;
      return DetailPage(imageUrl: imageUrl);  
    },      },
    );
  }
}








