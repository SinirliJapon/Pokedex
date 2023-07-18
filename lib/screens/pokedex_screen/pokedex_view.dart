import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon_bloc.dart';
import 'package:pokedex/bloc/pokemon_state.dart';
import 'package:pokedex/screens/pokedex_screen/components/pokedex_app_bar.dart';
import 'components/pokedex_view_column.dart';

class PokedexView extends StatefulWidget {
  const PokedexView({Key? key}) : super(key: key);

  @override
  State<PokedexView> createState() => _PokedexViewState();
}

class _PokedexViewState extends State<PokedexView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const PokedexAppBarTitle()),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoadInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PokemonPageLoadSuccess) {
            return PokedexViewColumn(state: state);
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
