import 'package:flutter/material.dart';

InputDecoration pokemonSearchDecoration() {
  return InputDecoration(
    hintText: 'Search Pokemon',
    prefixIcon: const Icon(Icons.search, color: Colors.grey),
    contentPadding: const EdgeInsets.all(12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: Colors.white,
  );
}
