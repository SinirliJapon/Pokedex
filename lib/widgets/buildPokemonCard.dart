import 'package:palette_generator/palette_generator.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:flutter/material.dart';

Widget buildPokemonCard(BuildContext context, Pokemon pokemon) {
  return FutureBuilder(
    future: PaletteGenerator.fromImageProvider(
      NetworkImage(pokemon.imageUrl),
    ),
    builder: (context, snapshot) {
      final backgroundColor = snapshot.connectionState == ConnectionState.done
          ? snapshot.data?.dominantColor?.color ?? Colors.white
          : Colors.white;

      return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  backgroundColor.withOpacity(0.7),
                  backgroundColor.withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: GridTile(
              child: Column(
                children: [
                  Image.network(pokemon.imageUrl),
                  Text(
                    pokemon.name[0].toUpperCase() + pokemon.name.substring(1),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}