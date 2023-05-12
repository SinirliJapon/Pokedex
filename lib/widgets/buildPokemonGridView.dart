import 'package:pokedex/bloc/pokemon_state.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/widgets/buildPokemonCard.dart';

Widget buildPokemonGridView(
    BuildContext context, PokemonPageLoadSuccess state) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
    ),
    itemCount: state.pokemon.length,
    itemBuilder: (context, index) {
      return buildPokemonCard(context, state.pokemon[index]);
    },
  );
}
