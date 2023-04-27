import 'package:pokedex/bloc/pokemon_event.dart';
import 'package:pokedex/bloc/pokemon_state.dart';
import 'package:pokedex/pokemon_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _pokemonRepository = PokemonRepository();

  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonPageRequest>((event, emit) async {
      if (event is PokemonPageRequest) {
        emit(PokemonLoadInProgress());

        try {
          final pokemonPageResponse =
              await _pokemonRepository.getPokemonPage(event.page);
          emit(PokemonPageLoadSuccess(
            pokemonListings: pokemonPageResponse.pokemonListings,
            canLoadNextPage: pokemonPageResponse.canLoadNextPage,
          ));
        } catch (e) {
          emit(PokemonPageLoadFailed(error: e));
        }
      }
    });
  }
}
