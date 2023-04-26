import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon_state.dart';

import 'bloc/pokemon_bloc.dart';

class PokedexView extends StatelessWidget {
  const PokedexView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Pokedex'),
        ),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonPageLoadSuccess) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: state.pokemonLisgtings.length,
              itemBuilder: (context, index) {
                return Card(
                  child: GridTile(
                    child: Column(
                      children: [
                        Image.network(''),
                        Text(state.pokemonLisgtings[index].name),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is PokemonPageLoadFailed) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
