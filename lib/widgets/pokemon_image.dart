import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_details.dart';

Image pokemonImage(PokemonDetails details) {
  return Image.network(
    details.imageUrl,
    height: 300,
    width: 300,
    fit: BoxFit.contain,
  );
}
