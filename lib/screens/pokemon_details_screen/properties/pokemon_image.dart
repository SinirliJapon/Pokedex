import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_details.dart';

class PokemonImage extends StatelessWidget {
  final PokemonDetails details;

  const PokemonImage({
    required this.details,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      details.imageUrl,
      height: 300,
      width: 300,
      fit: BoxFit.contain,
    );
  }
}
