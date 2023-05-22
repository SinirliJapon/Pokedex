import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/data/pokemon_info_response.dart';
import 'package:pokedex/data/pokemon_species_info_response.dart';
import 'package:pokedex/model/pokemon_details.dart';
import 'package:pokedex/repository/pokemon_repository.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetails?> {
  final _pokemonRepository = PokemonRepository();

  PokemonDetailsCubit() : super(null);

  void getPokemonDetails(int pokemonId) async {
    final responses = await Future.wait([
      _pokemonRepository.getPokemonInfo(pokemonId),
      _pokemonRepository.getPokemonSpeciesInfo(pokemonId)
    ]);

    final pokemonInfo = responses[0] as PokemonInfoResponse;
    final speciesInfo = responses[1] as PokemomonSpeciesInfoResponse;

    emit(PokemonDetails(
      id: pokemonInfo.id,
      name: pokemonInfo.name,
      imageUrl: pokemonInfo.imageUrl,
      types: pokemonInfo.types,
      height: pokemonInfo.height,
      weight: pokemonInfo.weight,
      description: speciesInfo.description,
      abilities: pokemonInfo.abilities,
    ));
  }

  void clearPokemonDetails() => emit(null);
}
