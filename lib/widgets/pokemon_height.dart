import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_details.dart';

Text pokemonHeight(PokemonDetails details) {
  return Text(
    details.height.toString(),
    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  );
}
