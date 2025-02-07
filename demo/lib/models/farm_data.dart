class FarmData {
  final String farmId;
  final String currentCrop;
  final double farmArea;
  final String irrigationType;
  final String soilType;
  final String season;
  final String previousCrop1;
  final String previousCrop2;
  final String previousCrop3;
  final double rotationHealthScore;
  final double fertilizerUsed;
  final double pesticideUsed;
  final double waterUsage;
  final double yield;
  final double organicMatterContent;
  final double soilPH;
  final int chemicalFreeDays;
  final double sustainabilityScore;
  final String fertilizerCategory;
  final String pesticideCategory;
  final String currentFertilizer;
  final String currentPesticide;
  final String sustainableRecommendations;

  FarmData({
    required this.farmId,
    required this.currentCrop,
    required this.farmArea,
    required this.irrigationType,
    required this.soilType,
    required this.season,
    required this.previousCrop1,
    required this.previousCrop2,
    required this.previousCrop3,
    required this.rotationHealthScore,
    required this.fertilizerUsed,
    required this.pesticideUsed,
    required this.waterUsage,
    required this.yield,
    required this.organicMatterContent,
    required this.soilPH,
    required this.chemicalFreeDays,
    required this.sustainabilityScore,
    required this.fertilizerCategory,
    required this.pesticideCategory,
    required this.currentFertilizer,
    required this.currentPesticide,
    required this.sustainableRecommendations,
  });

  factory FarmData.fromJson(Map<String, dynamic> json) {
    return FarmData(
      farmId: json['Farm_ID'],
      currentCrop: json['Current_Crop'],
      farmArea: json['Farm_Area(acres)'].toDouble(),
      irrigationType: json['Irrigation_Type'],
      soilType: json['Soil_Type'],
      season: json['Season'],
      previousCrop1: json['Previous_Crop_1'],
      previousCrop2: json['Previous_Crop_2'],
      previousCrop3: json['Previous_Crop_3'],
      rotationHealthScore: json['Rotation_Health_Score'].toDouble(),
      fertilizerUsed: json['Fertilizer_Used(tons)'].toDouble(),
      pesticideUsed: json['Pesticide_Used(kg)'].toDouble(),
      waterUsage: json['Water_Usage(cubic meters)'].toDouble(),
      yield: json['Yield(tons)'].toDouble(),
      organicMatterContent: json['Organic_Matter_Content(%)'].toDouble(),
      soilPH: json['Soil_pH'].toDouble(),
      chemicalFreeDays: json['Chemical_Free_Days'],
      sustainabilityScore: json['Sustainability_Score'].toDouble(),
      fertilizerCategory: json['Fertilizer_Category'],
      pesticideCategory: json['Pesticide_Category'],
      currentFertilizer: json['Current_Fertilizer'],
      currentPesticide: json['Current_Pesticide'],
      sustainableRecommendations: json['Sustainable_Recommendations'],
    );
  }
}
