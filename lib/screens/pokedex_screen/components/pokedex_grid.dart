import 'package:flutter/material.dart';
import 'package:pokedex/bloc/pokemon_state.dart';
import 'package:pokedex/constants/colors/app_colors.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/screens/pokedex_screen/components/pokemon_card.dart';

class PokedexGrid extends StatefulWidget {
  final PokemonPageLoadSuccess state;
  final String searchQuery;
  final List<Pokemon> searchResults;

  const PokedexGrid(
      {required this.state,
      Key? key,
      required this.searchQuery,
      required this.searchResults})
      : super(key: key);

  @override
  State<PokedexGrid> createState() => _PokedexGridState();
}

class _PokedexGridState extends State<PokedexGrid> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          color: AppColors.backgroundColor.withOpacity(0.7),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: widget.searchQuery.isEmpty
                ? widget.state.pokemon.length
                : widget.searchResults.length,
            itemBuilder: (context, index) {
              final pokemon = widget.searchQuery.isEmpty
                  ? widget.state.pokemon[index]
                  : widget.searchResults[index];
              return PokemonCard(pokemon: pokemon);
            },
          ),
        ),
      ),
    );
  }
}
