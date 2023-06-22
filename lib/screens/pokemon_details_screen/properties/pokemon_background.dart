import 'package:flutter/material.dart';

class PokemonBackgroundColor extends StatelessWidget {
  final List<String> types;

  const PokemonBackgroundColor({
    required this.types,
    Key? key,
  }) : super(key: key);

  static const Map<String, Color?> typeToColor = {
    'normal': Color(0xFFbdbeb0),
    'poison': Color(0xFF995E98),
    'psychic': Color(0xFFE96EB0),
    'grass': Color(0xFF9CD363),
    'ground': Color(0xFFE3C969),
    'ice': Color(0xFFAFF4FD),
    'fire': Color(0xFFE7614D),
    'rock': Color(0xFFCBBD7C),
    'dragon': Color(0xFF8475F7),
    'water': Color(0xFF6DACF8),
    'electric': Color(0xFFF8D030),
    'bug': Color(0xFFC5D24A),
    'dark': Color(0xFF886958),
    'fighting': Color(0xFF9E5A4A),
    'ghost': Color(0xFF7774CF),
    'steel': Color(0xFFC3C3D9),
    'flying': Color(0xFF81A2F8),
    'fairy': Color(0xFFEEB0FA),
  };

  Color getPokemonBackgroundColor() {
    if (types.isEmpty) {
      return Colors.transparent;
    } else {
      final firstType = types.first.toLowerCase();
      return typeToColor[firstType] ?? Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: getPokemonBackgroundColor(),
    );
  }
}
