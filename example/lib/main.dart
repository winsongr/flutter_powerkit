import 'package:flutter/material.dart';
import 'package:flutter_powerkit/flutter_powerkit.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Hello World!2'.capitalize(),
            style: context.titleMedium,
          ),
        ),
      ),
    );
  }
}
