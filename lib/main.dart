import 'package:flutter/material.dart';
import 'package:gpk_app/app_navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: AppNavigation(),
    );
  }
}
