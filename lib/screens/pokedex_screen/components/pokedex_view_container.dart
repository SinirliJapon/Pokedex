import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:pokedex/constants/colors/app_colors.dart';
import 'package:pokedex/constants/decorations/pokemon_card_decoration.dart';
import 'package:pokedex/model/pokemon.dart';

class PokedexViewContainer extends StatelessWidget {
  final Color backgroundColor;
  final Pokemon pokemon;

  const PokedexViewContainer({
    required this.backgroundColor,
    required this.pokemon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: pokemonCardDecoration(backgroundColor),
      child: GridTile(
        child: Column(
          children: [
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: pokemon.imageUrl,
              height: 90,
            ),
            Text(
              pokemon.name[0].toUpperCase() + pokemon.name.substring(1),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColors.fontGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
