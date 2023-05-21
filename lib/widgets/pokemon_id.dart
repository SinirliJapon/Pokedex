import 'package:flutter/material.dart';
import 'package:pokedex/constants/app_colors.dart';
import 'package:pokedex/model/pokemon_details.dart';

Positioned pokemonID(Color? backgroundColor, PokemonDetails details) {
  return Positioned(
    top: 0,
    left: 0,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(30)),
        color: backgroundColor?.withOpacity(0.2),
      ),
      height: 50,
      width: 50,
      child: Center(
        child: Text(
          details.id.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.fontGrey,
          ),
        ),
      ),
    ),
  );
}
