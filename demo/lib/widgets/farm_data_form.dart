import 'package:flutter/material.dart';
import 'package:demo/models/farm_data.dart';

class FarmDataForm extends StatefulWidget {
  final Function(FarmData) onSubmit;

  const FarmDataForm({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<FarmDataForm> createState() => _FarmDataFormState();
}

class _FarmDataFormState extends State<FarmDataForm> {
  final _formKey = GlobalKey<FormState>();
  bool _showAdvanced = false;

  // Form controllers
  final _locationController = TextEditingController();
  final _landAreaController = TextEditingController();
  final _soilPhController = TextEditingController();
  final _fertilizerController = TextEditingController();
  final _pesticideController = TextEditingController();

  // Form values
  String _season = 'Summer';
  String _soilType = 'Clay';
  String _irrigationType = 'Drip';
  Map<String, double> _soilNutrients = {
    'N': 0.0,
    'P': 0.0,
    'K': 0.0,
  };

  @override
  void dispose() {
    _locationController.dispose();
    _landAreaController.dispose();
    _soilPhController.dispose();
    _fertilizerController.dispose();
    _pesticideController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final farmData = FarmData(
        season: _season,
        soilType: _soilType,
        irrigationType: _irrigationType,
        location: _locationController.text,
        landArea: double.parse(_landAreaController.text),
        soilPh: _soilPhController.text.isEmpty
            ? null
            : double.parse(_soilPhController.text),
        currentFertilizer:
        _fertilizerController.text.isEmpty ? null : _fertilizerController.text,
        currentPesticide:
        _pesticideController.text.isEmpty ? null : _pesticideController.text,
        soilNutrients: _soilNutrients,
      );

      widget.onSubmit(farmData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Required Fields
          const Text(
            'Required Information',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Season',
              border: OutlineInputBorder(),
            ),
            value: _season,
            items: ['Summer', 'Winter', 'Spring', 'Fall']
                .map((season) => DropdownMenuItem(
              value: season,
              child: Text(season),
            ))
                .toList(),
            onChanged: (value) => setState(() => _season = value!),
          ),
          const SizedBox(height: 16),

          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Soil Type',
              border: OutlineInputBorder(),
            ),
            value: _soilType,
            items: ['Clay', 'Sandy', 'Loamy', 'Silt', 'Peat']
                .map((type) => DropdownMenuItem(
              value: type,
              child: Text(type),
            ))
                .toList(),
            onChanged: (value) => setState(() => _soilType = value!),
          ),
          const SizedBox(height: 16),

          TextFormField(
            controller: _locationController,
            decoration: const InputDecoration(
              labelText: 'Location',
              border: OutlineInputBorder(),
            ),
            validator: (value) =>
            value?.isEmpty ?? true ? 'Please enter location' : null,
          ),
          const SizedBox(height: 16),

          TextFormField(
            controller: _landAreaController,
            decoration: const InputDecoration(
              labelText: 'Land Area (hectares)',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            validator: (value) =>
            value?.isEmpty ?? true ? 'Please enter land area' : null,
          ),
          const SizedBox(height: 16),

          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Irrigation Type',
              border: OutlineInputBorder(),
            ),
            value: _irrigationType,
            items: ['Drip', 'Sprinkler', 'Flood', 'Rainfed']
                .map((type) => DropdownMenuItem(
              value: type,
              child: Text(type),
            ))
                .toList(),
            onChanged: (value) => setState(() => _irrigationType = value!),
          ),
          const SizedBox(height: 24),

          // Advanced Section Toggle
          InkWell(
            onTap: () => setState(() => _showAdvanced = !_showAdvanced),
            child: Row(
              children: [
                Icon(_showAdvanced
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
                const SizedBox(width: 8),
                const Text(
                  'Advanced Options',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          if (_showAdvanced) ...[
            TextFormField(
              controller: _soilPhController,
              decoration: const InputDecoration(
                labelText: 'Soil pH',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _fertilizerController,
              decoration: const InputDecoration(
                labelText: 'Current Fertilizer',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _pesticideController,
              decoration: const InputDecoration(
                labelText: 'Current Pesticide',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Soil Nutrients
            const Text(
              'Soil Nutrients',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'N (%)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => setState(() =>
                    _soilNutrients['N'] = double.tryParse(value) ?? 0),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'P (%)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => setState(() =>
                    _soilNutrients['P'] = double.tryParse(value) ?? 0),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'K (%)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => setState(() =>
                    _soilNutrients['K'] = double.tryParse(value) ?? 0),
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Get Recommendations',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}