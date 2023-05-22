import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/model/pokemon_details.dart';

Row pokemonTypes(PokemonDetails details) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: details.types.map((type) => pokemonTypeView(type)).toList(),
  );
}

Widget pokemonTypeView(String type) {
  final Map<String, String> typeToIcon = {
    'normal': 'assets/icons/normal.svg',
    'poison': 'assets/icons/poison.svg',
    'psychic': 'assets/icons/psychic.svg',
    'grass': 'assets/icons/grass.svg',
    'ground': 'assets/icons/ground.svg',
    'ice': 'assets/icons/ice.svg',
    'fire': 'assets/icons/fire.svg',
    'rock': 'assets/icons/rock.svg',
    'dragon': 'assets/icons/dragon.svg',
    'water': 'assets/icons/water.svg',
    'electric': 'assets/icons/electric.svg',
    'bug': 'assets/icons/bug.svg',
    'dark': 'assets/icons/dark.svg',
    'fighting': 'assets/icons/fighting.svg',
    'ghost': 'assets/icons/ghost.svg',
    'steel': 'assets/icons/steel.svg',
    'flying': 'assets/icons/flying.svg',
    'fairy': 'assets/icons/fairy.svg',
  };

  final Map<String, Color> typeToColor = {
    'normal': const Color(0xFFbdbeb0),
    'poison': const Color(0xFF995E98),
    'psychic': const Color(0xFFE96EB0),
    'grass': const Color(0xFF9CD363),
    'ground': const Color(0xFFE3C969),
    'ice': const Color(0xFFAFF4FD),
    'fire': const Color(0xFFE7614D),
    'rock': const Color(0xFFCBBD7C),
    'dragon': const Color(0xFF8475F7),
    'water': const Color(0xFF6DACF8),
    'electric': const Color(0xFFF8D030),
    'bug': const Color(0xFFC5D24A),
    'dark': const Color(0xFF886958),
    'fighting': const Color(0xFF9E5A4A),
    'ghost': const Color(0xFF7774CF),
    'steel': const Color(0xFFC3C3D9),
    'flying': const Color(0xFF81A2F8),
    'fairy': const Color(0xFFEEB0FA),
  };

  final String? iconAsset = typeToIcon[type];
  final Color color = typeToColor[type] ?? Colors.black;
  final Widget icon = iconAsset != null
      ? SvgPicture.asset(iconAsset, width: 16, height: 16)
      : const SizedBox();

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 4),
          Text(
            type.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
