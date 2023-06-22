import 'package:flutter/material.dart';
import 'package:pokedex/bloc/pokemon_state.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/screens/pokedex_screen/components/pokedex_grid.dart';
import 'package:pokedex/screens/pokedex_screen/components/pokedex_search_box.dart';

class PokedexViewColumn extends StatefulWidget {
  final PokemonPageLoadSuccess state;

  const PokedexViewColumn({required this.state, Key? key}) : super(key: key);

  @override
  State<PokedexViewColumn> createState() => _PokedexViewColumnState();
}

class _PokedexViewColumnState extends State<PokedexViewColumn> {
  String searchQuery = '';
  List<Pokemon> searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PokedexSearchBox(
          state: widget.state,
          onSearchQueryChanged: (value) {
            setState(() {
              searchQuery = value.toLowerCase();
              searchResults = widget.state.pokemon
                  .where((pokemon) =>
                      pokemon.name.toLowerCase().startsWith(searchQuery))
                  .toList();
            });
          },
        ),
        PokedexGrid(
          state: widget.state,
          searchQuery: searchQuery,
          searchResults: searchResults,
        ),
      ],
    );
  }
}
