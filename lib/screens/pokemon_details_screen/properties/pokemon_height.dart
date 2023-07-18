import 'package:flutter/material.dart';
import 'package:pokedex/constants/colors/app_colors.dart';
import 'package:pokedex/model/pokemon_details.dart';

class PokemonHeight extends StatelessWidget {
  final PokemonDetails details;

  const PokemonHeight({
    required this.details,
    Key? key,
  }) : super(key: key);

  double getMetricHeight() {
    return details.height / 10;
  }

  @override
  Widget build(BuildContext context) {
    final metricHeight = getMetricHeight();

    return Column(
      children: [
        Text(
          "${metricHeight.toDouble()}m",
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
