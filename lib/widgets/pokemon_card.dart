import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/nav_cubit.dart';
import 'package:pokedex/constants/app_colors.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:flutter/material.dart';

Widget buildPokemonCard(BuildContext context, Pokemon pokemon) {
  const backgroundColor = AppColors.backgroundColor;

  return GestureDetector(
    onTap: () =>
        BlocProvider.of<NavCubit>(context).showPokemonDetails(pokemon.id),
    child: Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<NavCubit>(context).showPokemonDetails(pokemon.id);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                backgroundColor.withOpacity(0.7),
                backgroundColor.withOpacity(0.5),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: GridTile(
            child: Column(
              children: [
                Image.network(
                  pokemon.imageUrl,
                  height: 90,
                ),
                Text(
                  pokemon.name[0].toUpperCase() + pokemon.name.substring(1),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.fontGrey),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
