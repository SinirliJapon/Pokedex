import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon_details_cubit.dart';
import 'package:pokedex/model/pokemon_details.dart';
import 'package:pokedex/widgets/pokemon_details_container.dart';

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
              ? pokemonDetailsContainer(details)
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
