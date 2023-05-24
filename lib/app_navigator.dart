import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/nav_cubit.dart';
import 'package:pokedex/screens/pokedex_view.dart';
import 'package:pokedex/screens/pokemon_details_view.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final navCubit = BlocProvider.of<NavCubit>(context);
        navCubit.popToPokedex();
        return false;
      },
      child: BlocBuilder<NavCubit, int?>(
        builder: (context, pokemonId) {
          return Navigator(
            pages: [
              const MaterialPage(child: PokedexView()),
              if (pokemonId != null)
                const MaterialPage(child: PokemonDetailsView()),
            ],
            onPopPage: (route, result) {
              final navCubit = BlocProvider.of<NavCubit>(context);
              navCubit.popToPokedex();
              return route.didPop(result);
            },
          );
        },
      ),
    );
  }
}
