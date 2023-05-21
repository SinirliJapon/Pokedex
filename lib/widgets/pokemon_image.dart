import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_details.dart';

Image pokemonImage(PokemonDetails details) {
  return Image.network(details.imageUrl);
}
