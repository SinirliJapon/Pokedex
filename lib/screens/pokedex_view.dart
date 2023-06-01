import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon_bloc.dart';
import 'package:pokedex/bloc/pokemon_state.dart';
import 'package:pokedex/constants/app_colors.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

class PokedexView extends StatefulWidget {
  const PokedexView({Key? key}) : super(key: key);

  @override
  State<PokedexView> createState() => _PokedexViewState();
}

class _PokedexViewState extends State<PokedexView> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

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
              fontSize: 22,
            ),
          ),
        ),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoadInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PokemonPageLoadSuccess) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value.toLowerCase();
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search Pokemon',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: AppColors.backgroundColor.withOpacity(0.7),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: state.pokemon.length,
                      itemBuilder: (context, index) {
                        final pokemon = state.pokemon[index];
                        if (searchQuery.isNotEmpty &&
                            !pokemon.name.contains(searchQuery)) {
                          return Container(); // Skip if the Pokemon doesn't match the search query
                        }
                        return buildPokemonCard(context, pokemon);
                      },
                    ),
                  ),
                ),
              ],
            );
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
