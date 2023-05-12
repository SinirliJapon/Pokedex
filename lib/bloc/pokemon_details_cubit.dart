import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/data/pokemon_info_response.dart';
import 'package:pokedex/data/pokemon_species_info_response.dart';
import 'package:pokedex/model/pokemon_details.dart';
import 'package:pokedex/repository/pokemon_repository.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetails> {
  final _pokemonRepository = PokemonRepository();

  PokemonDetailsCubit()
      : super(PokemonDetails(
          id: 0,
          name: "",
          imageUrl: "",
          types: [],
          height: 0,
          weight: 0,
          description: "",
        ));

  void getPokemonDetails(int pokemonId) async {
    final responses = await Future.wait([
      _pokemonRepository.getPokemonInfo(pokemonId),
      _pokemonRepository.getPokemonSpeciesInfo(pokemonId)
    ]);

    final pokemonInfo = responses[0] as PokemonInfoResponse;
    final speciesInfo = responses[1] as PokemonSpeciesInfoResponse;

    emit(PokemonDetails(
      id: pokemonInfo.id,
      name: pokemonInfo.name,
      imageUrl: pokemonInfo.imageUrl,
      types: pokemonInfo.types,
      height: pokemonInfo.height,
      weight: pokemonInfo.weight,
      description: speciesInfo.description,
    ));
  }

  void clearPokemonDetails() => emit(PokemonDetails(
        id: 0,
        name: "",
        imageUrl: "",
        types: [],
        height: 0,
        weight: 0,
        description: "",
      ));
}
