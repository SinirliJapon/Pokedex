import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_details.dart';

Image pokemonImage(PokemonDetails details) {
  return Image.network(
    details.imageUrl,
    errorBuilder: (
      BuildContext context,
      Object exception,
      StackTrace? stackTrace,
    ) {
      print('Error loading image: $exception');
      return const Text('Error loading image');
    },
  );
}
