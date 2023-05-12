import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/nav_cubit.dart';
import 'package:pokedex/screens/pokedex_view.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, int?>(builder: (context, pokemonId) {
      return Navigator(
          pages: [
            const MaterialPage(child: PokedexView()),
            if (pokemonId != null)
              MaterialPage(child: Text(pokemonId.toString())),
          ],
          onPopPage: (route, result) {
            return route.didPop(result);
          });
    });
  }
}
