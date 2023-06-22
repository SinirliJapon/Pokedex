import 'package:flutter/material.dart';
import 'package:pokedex/bloc/pokemon_state.dart';
import 'package:pokedex/constants/colors/app_colors.dart';
import 'package:pokedex/constants/decorations/pokemon_search_decoration.dart';

class PokedexSearchBox extends StatelessWidget {
  final PokemonPageLoadSuccess state;
  final ValueChanged<String> onSearchQueryChanged;

  const PokedexSearchBox({
    required this.state,
    required this.onSearchQueryChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primarySwatch,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: Colors.white,
            child: TextField(
              onChanged: onSearchQueryChanged,
              decoration: pokemonSearchDecoration(),
            ),
          ),
        ),
      ),
    );
  }
}
