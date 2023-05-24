import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon_bloc.dart';
import 'package:pokedex/bloc/pokemon_state.dart';
import 'package:pokedex/constants/app_colors.dart';
import 'package:pokedex/widgets/pokemon_grid_view.dart';

class PokedexView extends StatelessWidget {
  const PokedexView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Pokedex',
          style: TextStyle(
              color: AppColors.fontGrey,
              fontWeight: FontWeight.bold,
              fontSize: 22),
        )),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoadInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PokemonPageLoadSuccess) {
            return buildPokemonGridView(context, state);
          } else if (state is PokemonPageLoadFailed) {
            return Center(child: Text(state.error.toString()));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
