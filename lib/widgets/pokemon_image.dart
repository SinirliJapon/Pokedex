import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_details.dart';

Image pokemonImage(PokemonDetails details) {
  return Image.network(
    details.imageUrl,
    height: 200,
    width: 200,
    fit: BoxFit.contain,
  );
}
