import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/nav_cubit.dart';
import 'package:pokedex/constants/colors/app_colors.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/screens/pokedex_screen/components/pokedex_view_container.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const backgroundColor = AppColors.backgroundColor;
    return GestureDetector(
      onTap: () => BlocProvider.of<NavCubit>(context).showPokemonDetails(pokemon.id),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap: () =>BlocProvider.of<NavCubit>(context).showPokemonDetails(pokemon.id),
          child: PokedexViewContainer( backgroundColor: backgroundColor, pokemon: pokemon),
        ),
      ),
    );
  }
}
