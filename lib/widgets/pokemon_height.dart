import 'package:flutter/material.dart';
import 'package:pokedex/constants/app_colors.dart';
import 'package:pokedex/model/pokemon_details.dart';

Column pokemonHeight(PokemonDetails details) {
  final metricHeight = details.height / 10;
  return Column(
    children: [
      Text(
        "${metricHeight.toDouble()}m",
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.fontGrey,
        ),
      ),
      const Text(
        'WEIGHT',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.fontGrey,
        ),
      ),
    ],
  );
}
