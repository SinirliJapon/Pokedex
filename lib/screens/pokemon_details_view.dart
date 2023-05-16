import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedex/bloc/pokemon_details_cubit.dart';
import 'package:pokedex/model/pokemon_details.dart';
import 'package:pokedex/widgets/pokemon_height.dart';
import 'package:pokedex/widgets/pokemon_image.dart';
import '../widgets/pokemon_name.dart';
import '../widgets/pokemon_types.dart';
import '../widgets/pokemon_weight.dart';

class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView({Key? key}) : super(key: key);

  Future<Color?> pokedemonDetailsBackground(PokemonDetails details) async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(details.imageUrl),
    );
    return paletteGenerator.dominantColor?.color;
  }

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
                      color: backgroundColor,
                      child: Center(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 4.0,
                                  right: 8.0,
                                  left: 8.0,
                                  top: 8.0,
                                ),
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      pokemonImage(details),
                                      pokemonName(details),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(width: 10),
                                          pokemonWeight(details),
                                          const SizedBox(width: 10),
                                          pokemonTypes(details),
                                          const SizedBox(width: 10),
                                          pokemonHeight(details),
                                          const SizedBox(width: 10),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 8.0,
                                    right: 8.0,
                                    left: 8.0,
                                    top: 4.0,
                                  ),
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        details.description,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
