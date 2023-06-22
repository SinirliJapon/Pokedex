import 'package:flutter/material.dart';
import 'package:pokedex/constants/colors/app_colors.dart';

class PokemonDetailsAppBar extends StatelessWidget {
  final BuildContext context;

  const PokemonDetailsAppBar({
    required this.context,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 0,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.fontGrey,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          const SizedBox(width: 10),
          const Text(
            'Pokedex',
            style: TextStyle(
              color: AppColors.fontGrey,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
