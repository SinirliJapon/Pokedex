import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon_bloc.dart';
import 'package:pokedex/bloc/pokemon_state.dart';
import 'package:pokedex/constants/app_colors.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

class PokedexView extends StatefulWidget {
  const PokedexView({Key? key}) : super(key: key);

  @override
  State<PokedexView> createState() => _PokedexViewState();
}

class _PokedexViewState extends State<PokedexView> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  List<Pokemon> searchResults = []; // Temporary search results list
  FocusNode searchFocusNode = FocusNode(); // Add a focus node

  @override
  void initState() {
    super.initState();
    searchFocusNode.addListener(() {
      if (!searchFocusNode.hasFocus) {
        // When the focus is lost, hide the keyboard
        FocusScope.of(context).unfocus();
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

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
                Container(
                  color: AppColors.primarySwatch,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        color: Colors.white,
                        child: TextField(
                          controller: searchController,
                          focusNode: searchFocusNode, // Add the focus node
                          onChanged: (value) {
                            setState(() {
                              searchQuery = value.toLowerCase();
                              searchResults = state.pokemon
                                  .where((pokemon) => pokemon.name
                                      .toLowerCase()
                                      .startsWith(searchQuery))
                                  .toList();
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: 'Search Pokemon',
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    // Add a GestureDetector to handle tap gestures and hide the keyboard
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: Container(
                      color: AppColors.backgroundColor.withOpacity(0.7),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: searchQuery.isEmpty
                            ? state.pokemon.length
                            : searchResults.length,
                        itemBuilder: (context, index) {
                          final pokemon = searchQuery.isEmpty
                              ? state.pokemon[index]
                              : searchResults[index];
                          return buildPokemonCard(context, pokemon);
                        },
                      ),
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
