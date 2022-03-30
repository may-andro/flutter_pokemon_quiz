import 'package:flutter/material.dart';

class PokemonTypeColorMapper {
  Color map(String pokemonType) {
    switch (pokemonType) {
      case 'bug':
        return const Color(0xFFA6B91A);
      case 'dark':
        return const Color(0xFF705746);
      case 'dragon':
        return const Color(0xFF6F35FC);
      case 'electric':
        return const Color(0xFFF7D02C);
      case 'fairy':
        return const Color(0xFFD685AD);
      case 'fighting':
        return const Color(0xFFC22E28);
      case 'fire':
        return const Color(0xFFEE8130);
      case 'flying':
        return const Color(0xFFA98FF3);
      case 'ghost':
        return const Color(0xFF735797);
      case 'grass':
        return const Color(0xFF7AC74C);
      case 'ground':
        return const Color(0xFFE2BF65);
      case 'ice':
        return const Color(0xFF96D9D6);
      case 'normal':
        return const Color(0xFFA8A77A);
      case 'poison':
        return const Color(0xFFA33EA1);
      case 'psychic':
        return const Color(0xFFF95587);
      case 'rock':
        return const Color(0xFFB6A136);
      case 'steel':
        return const Color(0xFFB7B7CE);
      case 'water':
        return const Color(0xFF6390F0);
      default:
        return const Color(0xFF819595);
    }
  }
}
