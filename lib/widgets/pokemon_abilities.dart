import 'package:flutter/material.dart';
import 'package:pokedex/constants/app_colors.dart';
import 'package:pokedex/model/pokemon_details.dart';

Row pokemonAbilities(PokemonDetails details, Color? color) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: details.abilities
        .map((ability) => pokemonAbilitiesView(ability, color))
        .toList(),
  );
}

Padding pokemonAbilitiesView(String ability, Color? color) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color?.withOpacity(0.5),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Text(
        ability.toUpperCase(),
        style: const TextStyle(
            color: AppColors.fontGrey, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
