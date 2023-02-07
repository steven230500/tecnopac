class SpritesModel {
  final String backDefault;
  final String backFemale;
  final String backShiny;
  final String frontDefault;
  final String frontFemale;
  SpritesModel({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.frontDefault,
    required this.frontFemale,
  });

  factory SpritesModel.fromJson(Map<String, dynamic> json) {
    return SpritesModel(
      backDefault: json['back_default'] ?? '',
      backFemale: json['back_female'] ?? '',
      backShiny: json['back_shiny'] ?? '',
      frontDefault: json['front_default'] ?? '',
      frontFemale: json['front_female'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'backDefault': backDefault,
      'backFemale': backFemale,
      'backShiny': backShiny,
      'frontDefault': frontDefault,
      'frontFemale': frontFemale,
    };
  }
}
