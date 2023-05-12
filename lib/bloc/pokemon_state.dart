import 'package:pokedex/model/pokemon.dart';

abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoadInProgress extends PokemonState {}

class PokemonPageLoadSuccess extends PokemonState {
  final List<Pokemon> pokemon;
  final bool canLoadNextPage;

  PokemonPageLoadSuccess(
      {required this.pokemon, required this.canLoadNextPage});
}

class PokemonPageLoadFailed extends PokemonState {
  final Object error;

  PokemonPageLoadFailed({required this.error});
}
