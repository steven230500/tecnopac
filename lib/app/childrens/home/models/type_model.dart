class TypeModel {
  final String name;
  final String url;

  TypeModel({
    required this.name,
    required this.url,
  });

  factory TypeModel.fromJson(Map<String, dynamic> json) {
    return TypeModel(
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }
}
