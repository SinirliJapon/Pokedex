import 'package:pokedex/model/pokemon.dart';

class PokemonPageResponse {
  final List<Pokemon> pokemonListings;
  final bool canLoadNextPage;

  PokemonPageResponse(
      {required this.pokemonListings, required this.canLoadNextPage});

  factory PokemonPageResponse.fromJson(Map<String, dynamic> json) {
    final canLoadNextPage = json['next'] != null;
    final pokemonListings = (json['results'] as List)
        .map((listingJson) => Pokemon.fromJson(listingJson))
        .toList();

    return PokemonPageResponse(
        pokemonListings: pokemonListings, canLoadNextPage: canLoadNextPage);
  }
}
