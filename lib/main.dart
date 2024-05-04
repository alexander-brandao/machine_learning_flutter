import 'package:flutter/material.dart';

import 'welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Machine Learning',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.white,
          onPrimary: Colors.black12,
          secondary: Colors.black12,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.black54,
          onBackground: Colors.white,
          surface: Colors.black12,
          onSurface: Colors.white,
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}
