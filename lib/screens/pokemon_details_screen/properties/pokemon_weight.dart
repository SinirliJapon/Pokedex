import 'package:flutter/material.dart';
import 'package:pokedex/constants/colors/app_colors.dart';
import 'package:pokedex/model/pokemon_details.dart';

class PokemonWeight extends StatelessWidget {
  final PokemonDetails details;

  const PokemonWeight({
    required this.details,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kgWeight = details.weight / 10;

    return Column(
      children: [
        Text(
          "${kgWeight.toDouble()}kg",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.fontGrey,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'WEIGHT',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: AppColors.fontGrey,
          ),
        ),
      ],
    );
  }
}
