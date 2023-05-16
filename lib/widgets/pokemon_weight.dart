import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_details.dart';

Text pokemonWeight(PokemonDetails details) {
  return Text(
    details.weight.toString(),
    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  );
}
