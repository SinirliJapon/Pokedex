import 'package:flutter/material.dart';
import 'package:pokedex/constants/colors/app_colors.dart';

class PokedexAppBarTitle extends StatelessWidget {
  const PokedexAppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Pokedex',
          style: TextStyle(
            color: AppColors.fontGrey,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}
