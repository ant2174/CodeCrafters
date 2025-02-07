import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const CropRotationApp());
}

class CropRotationApp extends StatelessWidget {
  const CropRotationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI-Powered Crop Rotation',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}
