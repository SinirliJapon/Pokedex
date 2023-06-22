import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon_details_cubit.dart';
import 'package:pokedex/model/pokemon_details.dart';
import 'package:pokedex/screens/pokemon_details_screen/components/pokemon_details_container.dart';

class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PokemonDetailsCubit, PokemonDetails?>(
        builder: (context, details) {
          return details != null
              ? PokemonDetailsContainer(details: details)
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
