import 'package:flutter/material.dart';

BoxDecoration pokemonCardDecoration(Color backgroundColor) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    gradient: LinearGradient(
      colors: [
        backgroundColor.withOpacity(0.7),
        backgroundColor.withOpacity(0.5),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );
}
