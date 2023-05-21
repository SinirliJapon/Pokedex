import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget pokemonTypeView(String type) {
  Color color;
  Widget icon;

  switch (type) {
    case 'normal':
      icon = SvgPicture.asset(
        'assets/icons/normal.svg',
        width: 16,
        height: 16,
      );
      color = const Color(0xFFbdbeb0);
      break;
    case 'poison':
      icon = SvgPicture.asset(
        'assets/icons/poison.svg',
        width: 16,
        height: 16,
      );
      color = const Color(0xFF995E98);
      break;
    case 'psychic':
      icon = SvgPicture.asset(
        'assets/icons/psychic.svg',
        width: 16,
        height: 16,
      );
      color = const Color(0xFFE96EB0);
      break;
    case 'grass':
      icon = SvgPicture.asset(
        'assets/icons/grass.svg',
        width: 16,
        height: 16,
      );
      color = const Color(0xFF9CD363);
      break;
    case 'ground':
      icon = SvgPicture.asset(
        'assets/icons/ground.svg',
        width: 16,
        height: 16,
      );
      color = const Color(0xFFE3C969);
      break;
    case 'ice':
      icon = SvgPicture.asset(
        'assets/icons/ice.svg',
        width: 16,
        height: 16,
      );
      color = const Color(0xFFAFF4FD);
      break;
    case 'fire':
      icon = SvgPicture.asset(
        'assets/icons/fire.svg',
        width: 16,
        height: 16,
      );
      color = const Color(0xFFE7614D);
      break;
    case 'rock':
      icon = SvgPicture.asset(
        'assets/icons/rock.svg',
        width: 16,
        height: 16,
      );
      color = const Color(0xFFCBBD7C);
      break;
    case 'dragon':
      icon = SvgPicture.asset(
        'assets/icons/dragon.svg',
        width: 16,
        height: 16,
      );
      color = const Color(0xFF8475F7);
      break;
    case 'water':
      icon = SvgPicture.asset(
        'assets/icons/water.svg',
        width: 16,
        height: 16,
      );
      color = const Color(0xFF6DACF8);
      break;
    case 'bug':
      icon = SvgPicture.asset(
        'assets/icons/bug.svg',
        width: 16,
        height: 16,
      );
      color = const Color(0xFFC5D24A);
      break;
    case 'dark':
      icon = SvgPicture.asset(
        'assets/icons/dark.svg',
        width: 16,
        height: 16,
      );
      color = const Color(0xFF886958);
      break;
    case 'fighting':
      icon = SvgPicture.asset(
        'assets/icons/fighting.svg',
        width: 16,
        height: 16,
      );
      color = const Color(0xFF9E5A4A);
      break;
    case 'ghost':
      icon = SvgPicture.asset(
        'assets/icons/ghost.svg',
        width: 16,
        height: 16,
      );
      color = const Color(0xFF7774CF);
      break;
    case 'steel':
      icon = SvgPicture.asset(
        'assets/icons/steel.svg',
        width: 16,
        height: 16,
      );
      color = const Color(0xFFC3C3D9);
      break;
    case 'flying':
      icon = SvgPicture.asset(
        'assets/icons/flying.svg',
        width: 16,
        height: 16,
      );
      color = const Color(0xFF81A2F8);
      break;
    case 'fairy':
      icon = SvgPicture.asset(
        'assets/icons/fairy.svg',
        width: 16,
        height: 16,
      );
      color = const Color(0xFFEEB0FA);
      break;
    default:
      icon = const SizedBox();
      color = Colors.black;
      break;
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 4),
          Text(
            type.toUpperCase(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
