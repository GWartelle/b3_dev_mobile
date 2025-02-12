import 'package:flutter/material.dart';
import 'package:b3_shared_preferences/pages/form_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shared Preferences Exercize",
      home: FormPage(),
    );
  }
}
