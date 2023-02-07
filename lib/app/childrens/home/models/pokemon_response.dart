class PokemonResponse {
  final String name;
  final String url;
  PokemonResponse({
    required this.name,
    required this.url,
  });

  factory PokemonResponse.fromJson(Map<String, dynamic> json) {
    return PokemonResponse(
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
