import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_details.dart';
import 'package:pokedex/widgets/capitalize.dart';

Text pokemonName(PokemonDetails details) {
  return Text(
    details.name.capitalize(),
    style: const TextStyle(
      fontSize: 24, // Adjust the font size as needed
      fontWeight: FontWeight.bold, // Optional: Apply a bold font weight
    ),
  );
}
