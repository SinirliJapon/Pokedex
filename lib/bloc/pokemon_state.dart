import 'package:pokedex/pokemon_page_response.dart';

abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoadInProgress extends PokemonState {}

class PokemonPageLoadSuccess extends PokemonState {
  final List<PokemonListing> pokemonLisgtings;
  final bool canLoadPage;

  PokemonPageLoadSuccess(
      {required this.pokemonLisgtings, required this.canLoadPage});
}

class PokemonPageLoadFailed extends PokemonState {
  final Error error;

  PokemonPageLoadFailed({required this.error});
}
