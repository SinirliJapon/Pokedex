import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedex/model/pokemon_details.dart';

Future<Color?> pokedemonDetailsBackground(PokemonDetails details) async {
  try {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(details.imageUrl),
      timeout: const Duration(seconds: 5),
    );
    return paletteGenerator.dominantColor?.color;
  } catch (e) {
    print('Error loading image: $e');
    return Colors.white; // Fallback color in case of an error
  }
}
