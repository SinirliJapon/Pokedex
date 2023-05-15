import 'package:pokedex/bloc/pokemon_event.dart';
import 'package:pokedex/bloc/pokemon_state.dart';
import 'package:pokedex/repository/pokemon_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _pokemonRepository = PokemonRepository();

  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonPageRequest>((event, emit) async {
      emit(PokemonLoadInProgress());

      try {
        final pokemonPageResponse =
            await _pokemonRepository.getPokemonPage(event.page);
        emit(PokemonPageLoadSuccess(
          pokemon: pokemonPageResponse.pokemon,
          canLoadNextPage: pokemonPageResponse.canLoadNextPage,
        ));
      } catch (e) {
        emit(PokemonPageLoadFailed(error: e));
      }
    });
  }
}
