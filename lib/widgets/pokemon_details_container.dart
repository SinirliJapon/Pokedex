import 'package:flutter/material.dart';
import 'package:pokedex/constants/app_colors.dart';
import 'package:pokedex/model/pokemon_details.dart';
import 'package:pokedex/widgets/pokemon_abilities.dart';
import 'package:pokedex/widgets/pokemon_background.dart';
import 'package:pokedex/widgets/pokemon_height.dart';
import 'package:pokedex/widgets/pokemon_id.dart';
import 'package:pokedex/widgets/pokemon_image.dart';
import 'package:pokedex/widgets/pokemon_name.dart';
import 'package:pokedex/widgets/pokemon_stats.dart';
import 'package:pokedex/widgets/pokemon_types.dart';
import 'package:pokedex/widgets/pokemon_weight.dart';

Container pokemonDetailsContainer(
    BuildContext context, PokemonDetails details) {
  final color = getPokemonBackgroundColor(details.types);
  return Container(
    color: color.withOpacity(0.8),
    child: Stack(
      children: [
        Positioned(
            top: 50,
            left: 0,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: AppColors.fontGrey),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
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
            )),
        Column(
          children: [
            const SizedBox(height: 70),
            Expanded(flex: 3, child: pokemonImage(details)),
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        pokemonName(details),
                        const SizedBox(height: 30),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              pokemonHeight(details),
                              const VerticalDivider(
                                width: 24,
                                thickness: 0.2,
                                color: AppColors.dividerGrey,
                              ),
                              pokemonTypes(details),
                              const VerticalDivider(
                                width: 30,
                                thickness: 0.2,
                                color: AppColors.dividerGrey,
                              ),
                              pokemonWeight(details),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Divider(
                            height: 5,
                            thickness: 0.2,
                            color: AppColors.dividerGrey,
                          ),
                        ),
                        const Text(
                          'Base Stats',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.fontGrey,
                          ),
                        ),
                        const SizedBox(height: 10),
                        pokemonStats(details.stats),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Divider(
                            height: 5,
                            thickness: 0.2,
                            color: AppColors.dividerGrey,
                          ),
                        ),
                        pokemonAbilities(details, color),
                      ],
                    ),
                  ),
                  pokemonID(color, details),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
