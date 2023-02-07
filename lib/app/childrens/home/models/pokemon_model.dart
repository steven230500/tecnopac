import 'package:pokemon/app/childrens/home/models/sprites_model.dart';
import 'package:pokemon/app/childrens/home/models/type_model.dart';

class PokemonModel {
  final int id;
  final String name;
  final int order;
  final int height;
  final int weight;
  final List<TypeModel> types;
  final SpritesModel sprites;
  final String description;

  PokemonModel({
    required this.id,
    required this.name,
    required this.order,
    required this.height,
    required this.weight,
    required this.types,
    required this.sprites,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'order': order,
      'height': height,
      'weight': weight,
      'types': (types).map((e) => e.toMap()).toList(),
      'sprites': (sprites).toMap(),
      'description': description,
    };
  }

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      order: json['order'] ?? 0,
      height: json['height'] ?? 0,
      weight: json['weight'] ?? 0,
      types: (json['types'] as List)
          .map((e) => TypeModel.fromJson(e['type']))
          .toList(),
      sprites: SpritesModel.fromJson(json['sprites'] ?? {}),
      description: json['flavor_text'] ?? '',
    );
  }

  PokemonModel copyWith({
    int? id,
    String? name,
    int? order,
    int? height,
    int? weight,
    List<TypeModel>? types,
    SpritesModel? spirites,
    String? description,
  }) {
    return PokemonModel(
      id: id ?? this.id,
      name: name ?? this.name,
      order: order ?? this.order,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      types: types ?? this.types,
      sprites: spirites ?? sprites,
      description: description ?? this.description,
    );
  }
}
