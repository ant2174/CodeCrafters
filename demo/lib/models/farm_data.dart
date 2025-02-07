import 'package:flutter/material.dart';

class FarmDataForm extends StatefulWidget {
  const FarmDataForm({super.key});

  @override
  _FarmDataFormState createState() => _FarmDataFormState();
}

class _FarmDataFormState extends State<FarmDataForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {};
  bool showAdvanced = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Compulsory Inputs', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Season'),
              onSaved: (value) => formData['Season'] = value,
              validator: (value) => value == null || value.isEmpty ? 'Season is required' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Soil Type'),
              onSaved: (value) => formData['Soil_Type'] = value,
              validator: (value) => value == null || value.isEmpty ? 'Soil Type is required' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Irrigation Type'),
              onSaved: (value) => formData['Irrigation_Type'] = value,
              validator: (value) => value == null || value.isEmpty ? 'Irrigation Type is required' : null,
            ),

            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => setState(() => showAdvanced = !showAdvanced),
              child: Row(
                children: [
                  const Text('Advanced Inputs', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Icon(showAdvanced ? Icons.arrow_drop_up : Icons.arrow_drop_down)
                ],
              ),
            ),
            if (showAdvanced) ...[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Previous Crop 1'),
                onSaved: (value) => formData['Previous_Crop_1'] = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Previous Crop 2'),
                onSaved: (value) => formData['Previous_Crop_2'] = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Previous Crop 3'),
                onSaved: (value) => formData['Previous_Crop_3'] = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Soil pH'),
                onSaved: (value) => formData['Soil_pH'] = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Current Fertilizer'),
                onSaved: (value) => formData['Current_Fertilizer'] = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Current Pesticide'),
                onSaved: (value) => formData['Current_Pesticide'] = value,
              ),
            ],

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _showResultsDialog(context);
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _showResultsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Submitted Data'),
        content: SingleChildScrollView(
          child: ListBody(
            children: formData.entries.map((e) => Text('${e.key}: ${e.value}')).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
