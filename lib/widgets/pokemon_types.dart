import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_details.dart';
import 'package:pokedex/widgets/pokemon_type_view.dart';

Row pokemonTypes(PokemonDetails details) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: details.types.map((type) => pokemonTypeView(type)).toList(),
  );
}
