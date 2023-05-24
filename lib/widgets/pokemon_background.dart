import 'package:flutter/material.dart';

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

Color getPokemonBackgroundColor(List<String> types) {
  if (types.isEmpty) {
    return Colors.transparent;
  } else {
    final firstType = types.first.toLowerCase();
    return typeToColor[firstType] ?? Colors.transparent;
  }
}
