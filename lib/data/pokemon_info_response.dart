class PokemonInfoResponse {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final int height;
  final int weight;
  final List<String> abilities;

  PokemonInfoResponse(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.types,
      required this.height,
      required this.weight,
      required this.abilities});

  factory PokemonInfoResponse.fromJson(Map<String, dynamic> json) {
    final types = (json['types'] as List)
        .map((typeJson) => typeJson['type']['name'] as String)
        .toList();
    final abilities = (json['abilities'] as List)
        .map((abilityJson) => abilityJson['ability']['name'] as String)
        .toList();

    return PokemonInfoResponse(
        id: json['id'],
        name: json['name'],
        imageUrl: json['sprites']['front_default'],
        types: types,
        height: json['height'],
        weight: json['weight'],
        abilities: abilities);
  }
}
