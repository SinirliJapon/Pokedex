class PokemonInfoResponse {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final int height;
  final int weight;
  final List<String> abilities;
  final List<String> stats;

  PokemonInfoResponse({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.stats,
  });

  factory PokemonInfoResponse.fromJson(Map<String, dynamic> json) {
    final types = (json['types'] as List)
        .map((typeJson) => typeJson['type']['name'] as String)
        .toList();
    final abilities = (json['abilities'] as List)
        .map((abilityJson) => abilityJson['ability']['name'] as String)
        .toList();
    final baseStats = (json['stats'] as List)
        .map((statJson) => statJson['base_stat'] as int)
        .toList();
    final statNames = (json['stats'] as List)
        .map((statJson) => statJson['stat']['name'] as String)
        .toList();

    final stats = <String>[];
    for (int i = 0; i < baseStats.length; i++) {
      String stat = '${statNames[i]}: ${baseStats[i]}';
      stats.add(stat);
    }

    return PokemonInfoResponse(
      id: json['id'],
      name: json['name'],
      imageUrl: json['sprites']['other']['official-artwork']['front_default'],
      types: types,
      height: json['height'],
      weight: json['weight'],
      abilities: abilities,
      stats: stats,
    );
  }
}
