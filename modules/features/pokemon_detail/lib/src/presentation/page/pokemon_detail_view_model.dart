import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class PokemonDetailViewModel extends BaseViewModel {
  PokemonDetailViewModel(
    this._pokemonTypeImageMapper,
    this._pokemonTypeColorMapper,
  );

  final PokemonTypeImageMapper _pokemonTypeImageMapper;
  final PokemonTypeColorMapper _pokemonTypeColorMapper;

  late Pokemon _pokemon;

  int _selectedTabIndex = 0;

  String get pokemonImage => _pokemon.imageUrl;

  String get pokemonName => _pokemon.name.toUpperCase();

  int get pokemonIndex => _pokemon.index;

  int get selectedTabIndex => _selectedTabIndex;

  List<PokemonStat> get pokemonStats => _pokemon.stats;

  List<String> get pokemonTypeImages =>
      _pokemon.types.map((type) => _pokemonTypeImageMapper.map(type)).toList();

  Color get background => _pokemonTypeColorMapper.map(_pokemon.types[0]);

  void onInit(Pokemon pokemon) async {
    _pokemon = pokemon;
  }

  void toggleFavouritePokemon() {}

  void setSelectedTab(int tabIndex) {
    _selectedTabIndex = tabIndex;
    notifyListener();
  }
}
