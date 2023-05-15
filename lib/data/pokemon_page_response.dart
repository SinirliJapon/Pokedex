import 'package:pokedex/model/pokemon.dart';

class PokemonPageResponse {
  final List<Pokemon> pokemon;
  final bool canLoadNextPage;

  PokemonPageResponse({required this.pokemon, required this.canLoadNextPage});

  factory PokemonPageResponse.fromJson(Map<String, dynamic> json) {
    final canLoadNextPage = json['next'] != null;
    final pokemonListings = (json['results'] as List)
        .map((listingJson) => Pokemon.fromJson(listingJson))
        .toList();

    return PokemonPageResponse(
        pokemon: pokemonListings, canLoadNextPage: canLoadNextPage);
  }
}
