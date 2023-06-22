import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_details.dart';
import 'package:pokedex/screens/pokemon_details_screen/components/pokemon_details_column.dart';
import 'package:pokedex/screens/pokemon_details_screen/properties/pokemon_background.dart';
import 'package:pokedex/screens/pokemon_details_screen/components/pokemon_details_app_bar.dart';

class PokemonDetailsContainer extends StatelessWidget {
  final PokemonDetails details;

  const PokemonDetailsContainer({Key? key, required this.details}): super(key: key);

  @override
  Widget build(BuildContext context) {
    final PokemonBackgroundColor color =PokemonBackgroundColor(types: details.types);
    final Color backgroundColor = color.getPokemonBackgroundColor();

    return Container(
      color: backgroundColor.withOpacity(0.8),
      child: Stack(
        children: [
          PokemonDetailsAppBar(context: context),
          PokemonDetailsColumn( backgroundColor: backgroundColor, details: details),
        ],
      ),
    );
  }
}
