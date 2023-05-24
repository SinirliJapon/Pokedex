import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon_details_cubit.dart';
import 'package:pokedex/constants/app_colors.dart';
import 'package:pokedex/model/pokemon_details.dart';
import 'package:pokedex/widgets/pokemon_details_container.dart';

class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(
              color: AppColors.fontGrey,
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
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
