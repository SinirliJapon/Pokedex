import 'package:flutter/material.dart';
import 'package:pokedex/constants/app_colors.dart';
import 'package:pokedex/constants/stat_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

Column pokemonStats(List<String> stats) {
  List<Widget> statWidgets = [];

  Map<String, String> statAbbreviations = {
    'hp': 'HP',
    'attack': 'ATK',
    'defense': 'DEF',
    'special-attack': 'SP-ATK',
    'special-defense': 'SP-DEF',
    'speed': 'SPD',
  };

  for (int i = 0; i < stats.length; i++) {
    String stat = stats[i];
    List<String> parts = stat.split(':');
    String originalStatName = parts[0].trim();
    int baseStat = int.tryParse(parts[1].trim()) ?? 0;

    Color statColor = statColors[i % statColors.length];

    String statName = statAbbreviations[originalStatName] ?? originalStatName;

    statWidgets.add(
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    statName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.fontGrey,
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: LinearPercentIndicator(
                      animation: true,
                      barRadius: const Radius.circular(30),
                      padding: EdgeInsets.zero,
                      lineHeight: 20,
                      percent: baseStat / 300,
                      backgroundColor: Colors.grey[300],
                      progressColor: statColor,
                    ),
                  ),
                ),
              ],
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    baseStat.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.fontGrey,
                    ),
                  ),
                ),
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
