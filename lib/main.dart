import 'package:flutter/material.dart';
import 'core/constants.dart';
import 'core/theme.dart';
import 'screens/auth/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: appTheme,
      home: const LoginPage(),
    );
  }
}
