import 'package:flutter/material.dart';

class FarmDataForm extends StatefulWidget {
  const FarmDataForm({super.key});

  @override
  _FarmDataFormState createState() => _FarmDataFormState();
}

class _FarmDataFormState extends State<FarmDataForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {};

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Farm ID'),
            onSaved: (value) => formData['Farm_ID'] = value,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Current Crop'),
            onSaved: (value) => formData['Current_Crop'] = value,
          ),
          // Add more fields as per dataset headers
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // Implement logic to send data to Firebase ML model
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data...')),
                );
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
