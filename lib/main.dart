import 'package:acade360admin/Auth_Screen/Login_screen.dart';
import 'package:acade360admin/Theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Acade360AdminApp());
}

class Acade360AdminApp extends StatelessWidget {
  const Acade360AdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Acade360 Admin',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const LoginScreen(),
    );
  }
}
