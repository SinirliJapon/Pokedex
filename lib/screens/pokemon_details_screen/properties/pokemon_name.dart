import 'package:flutter/material.dart';
import 'package:pokedex/constants/colors/app_colors.dart';
import 'package:pokedex/model/pokemon_details.dart';

class PokemonName extends StatelessWidget {
  final PokemonDetails details;

  const PokemonName({
    required this.details,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      details.name.capitalize(),
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.fontGrey,
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
