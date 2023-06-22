import 'package:flutter/material.dart';
import 'package:pokedex/screens/pokemon_details_screen/components/pokemon_details_stack.dart';
import 'package:pokedex/model/pokemon_details.dart';
import '../properties/pokemon_image.dart';

class PokemonDetailsColumn extends StatelessWidget {
  final PokemonDetails details;
  final Color backgroundColor;

  const PokemonDetailsColumn({
    Key? key,
    required this.details,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 70),
        Expanded(flex: 3, child: PokemonImage(details: details)),
        Expanded(
          flex: 4,
          child: PokemonDetailsStack(
            details: details,
            backgroundColor: backgroundColor,
          ),
        ),
      ],
    );
  }
}
