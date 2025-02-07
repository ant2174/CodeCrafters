import 'package:flutter/material.dart';
import '../widgets/farm_data_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crop Rotation Predictor'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: FarmDataForm(),
      ),
    );
  }
}
