import 'package:flutter/animation.dart';

class ColorService {
  Color getTypeColor(type) {
    switch (type) {
      case 'normal':
        return const Color(0xFFa0a2a0);
      case 'fighting':
        return const Color(0xFFff8100);
      case 'flying':
        return const Color(0xFF82baef);
      case 'poison':
        return const Color(0xFF923fcc);
      case 'ground':
        return const Color(0xFF92501b);
      case 'rock':
        return const Color(0xFFb0aa82);
      case 'bug':
        return const Color(0xFF92a212);
      case 'ghost':
        return const Color(0xFF703f70);
      case 'steel':
        return const Color(0xFF60a2b9);
      case 'fire':
        return const Color(0xFFe72324);
      case 'water':
        return const Color(0xFF2481ef);
      case 'grass':
        return const Color(0xFF3da224);
      case 'electric':
        return const Color(0xFFfac100);
      case 'psychic':
        return const Color(0xFFef3f7a);
      case 'ice':
        return const Color(0xFF3DD9FF);
      case 'dragon':
        return const Color(0xFF4f60e2);
      case 'dark':
        return const Color(0xFF4f3f3d);
      case 'fairy':
        return const Color(0xFFef70ef);
      case 'unknown':
        return const Color(0xFF689a8d);
      case 'shadow':
        return const Color(0xFF45454a);
      default:
        return const Color(0xFFFFFFFF);
    }
  }
}
