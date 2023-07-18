import 'package:flutter/material.dart';
import 'package:pokedex/constants/colors/app_colors.dart';

class PokedexAppBarTitle extends StatelessWidget {
  const PokedexAppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Pokedex',
          style: TextStyle(
            color: AppColors.fontGrey,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.star_border_outlined),
        ),
      ],
    );
  }
}
