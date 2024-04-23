import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // Ubahlah import sesuai dengan lokasi file SignInPage2.dart
import 'screens/article_screen.dart'; // Import halaman article
import 'screens/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', 
      routes: {
        '/': (context) => SignInPage2(), 
        '/article': (context) => NewsFeedPage2(), 
        // '/signup': (context) => SignupPage(),
      },
    );
  }
}
