import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon_details_cubit.dart';
import 'package:pokedex/constants/app_colors.dart';
import 'package:pokedex/model/pokemon_details.dart';
import 'package:pokedex/widgets/pokemon_details_background.dart';
import 'package:pokedex/widgets/pokemon_height.dart';
import 'package:pokedex/widgets/pokemon_image.dart';
import '../widgets/pokemon_name.dart';
import '../widgets/pokemon_types.dart';
import '../widgets/pokemon_weight.dart';

class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: BlocBuilder<PokemonDetailsCubit, PokemonDetails?>(
        builder: (context, details) {
          return details != null
              ? FutureBuilder<Color?>(
                  future: pokedemonDetailsBackground(details),
                  builder: (context, snapshot) {
                    final backgroundColor = snapshot.data;
                    return Container(
                      color: backgroundColor?.withOpacity(0.5),
                      child: Column(
                        children: [
                          pokemonImage(details),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          pokemonHeight(details),
                                          const VerticalDivider(
                                            width: 30,
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
                                        height: 10,
                                        thickness: 0.2,
                                        color: AppColors.dividerGrey,
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Text(
                                      details.description,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
