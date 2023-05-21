import 'package:flutter/material.dart';
import 'package:pokedex/constants/app_colors.dart';
import 'package:pokedex/model/pokemon_details.dart';
import 'package:pokedex/widgets/capitalize.dart';

Text pokemonName(PokemonDetails details) {
  return Text(
    details.name.capitalize(),
    style: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.fontGrey,
    ),
  );
}
