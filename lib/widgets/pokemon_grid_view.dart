import 'package:pokedex/bloc/pokemon_state.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants/app_colors.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

Widget buildPokemonGridView(
    BuildContext context, PokemonPageLoadSuccess state) {
  return Container(
    color: AppColors.backgroundColor.withOpacity(0.7),
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: state.pokemon.length,
      itemBuilder: (context, index) {
        return buildPokemonCard(context, state.pokemon[index]);
      },
    ),
  );
}
