class FarmData {
  final String season;
  final String soilType;
  final String irrigationType;
  final String location;
  final double landArea;

  // Advanced fields (optional)
  final List<String>? previousCrops;
  final double? soilPh;
  final String? currentFertilizer;
  final String? currentPesticide;
  final Map<String, double>? soilNutrients; // N, P, K values

  FarmData({
    required this.season,
    required this.soilType,
    required this.irrigationType,
    required this.location,
    required this.landArea,
    this.previousCrops,
    this.soilPh,
    this.currentFertilizer,
    this.currentPesticide,
    this.soilNutrients,
  });

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'season': season,
      'soilType': soilType,
      'irrigationType': irrigationType,
      'location': location,
      'landArea': landArea,
      'previousCrops': previousCrops,
      'soilPh': soilPh,
      'currentFertilizer': currentFertilizer,
      'currentPesticide': currentPesticide,
      'soilNutrients': soilNutrients,
    };
  }

  @override
  String toString() {
    return 'FarmData(season: $season, soilType: $soilType, irrigationType: $irrigationType, location: $location, landArea: $landArea)';
  }
}