import 'package:flutter/material.dart';
import 'package:pokedex/constants/colors/app_colors.dart';
import 'package:pokedex/constants/decorations/pokemon_container_decoration.dart';
import 'package:pokedex/model/pokemon_details.dart';
import 'package:pokedex/screens/pokemon_details_screen/properties/pokemon_abilities.dart';
import 'package:pokedex/screens/pokemon_details_screen/properties/pokemon_height.dart';
import 'package:pokedex/screens/pokemon_details_screen/properties/pokemon_id.dart';
import 'package:pokedex/screens/pokemon_details_screen/properties/pokemon_name.dart';
import 'package:pokedex/screens/pokemon_details_screen/properties/pokemon_stats.dart';
import 'package:pokedex/screens/pokemon_details_screen/properties/pokemon_types.dart';
import 'package:pokedex/screens/pokemon_details_screen/properties/pokemon_weight.dart';

class PokemonDetailsStack extends StatelessWidget {
  final PokemonDetails details;
  final Color backgroundColor;

  const PokemonDetailsStack({
    required this.details,
    required this.backgroundColor,
    Key? key,
  }) : super(key: key);

  Padding divider() {
    return const Padding(
      padding:
          EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
      child: Divider(
        height: 5,
        thickness: 0.5,
        color: AppColors.dividerGrey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: pokemonContainerDecoration(),
          child: Column(
            children: [
              const SizedBox(height: 10),
              PokemonName(details: details),
              const SizedBox(height: 30),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PokemonHeight(details: details),
                    const VerticalDivider(
                      width: 24,
                      thickness: 0.5,
                      color: AppColors.dividerGrey,
                    ),
                    PokemonTypes(details: details),
                    const VerticalDivider(
                      width: 30,
                      thickness: 0.5,
                      color: AppColors.dividerGrey,
                    ),
                    PokemonWeight(details: details),
                  ],
                ),
              ),
              divider(),
              const Text(
                'Base Stats',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.fontGrey,
                ),
              ),
              const SizedBox(height: 10),
              PokemonStats(stats: details.stats),
              divider(),
              PokemonAbilities(details: details, color: backgroundColor),
            ],
          ),
        ),
        PokemonID(backgroundColor: backgroundColor, details: details),
      ],
    );
  }
}
