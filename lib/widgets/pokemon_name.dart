import 'package:flutter/material.dart';
import 'package:pokedex/constants/app_colors.dart';
import 'package:pokedex/model/pokemon_details.dart';

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

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
