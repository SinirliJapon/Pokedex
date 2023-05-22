import 'package:flutter/material.dart';
import 'package:pokedex/constants/app_colors.dart';
import 'package:pokedex/constants/stat_colors.dart';

Column pokemonStats(List<String> stats) {
  List<Widget> statWidgets = [];

  for (int i = 0; i < stats.length; i++) {
    String stat = stats[i];
    List<String> parts = stat.split(':');
    String statName = parts[0].trim();
    int baseStat = int.tryParse(parts[1].trim()) ?? 0;

    Color statColor = statColors[i % statColors.length];

    statWidgets.add(
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  statName.toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.fontGrey),
                ),
                Text(
                  baseStat.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.fontGrey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: LinearProgressIndicator(
                value: baseStat / 100,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(statColor),
                minHeight: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  return Column(
    children: statWidgets,
  );
}
