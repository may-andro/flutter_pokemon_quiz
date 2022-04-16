import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class PokemonDetailViewModel extends BaseViewModel {
  PokemonDetailViewModel(
    this._pokemonTypeImageMapper,
    this._pokemonTypeColorMapper,
    this._isFavoritePokemonUseCase,
    this._addFavoritePokemonUseCase,
    this._removeFavoritePokemonUseCase,
  );

  final PokemonTypeImageMapper _pokemonTypeImageMapper;
  final PokemonTypeColorMapper _pokemonTypeColorMapper;
  final IsFavoritePokemonUseCase _isFavoritePokemonUseCase;
  final AddFavoritePokemonUseCase _addFavoritePokemonUseCase;
  final RemoveFavoritePokemonUseCase _removeFavoritePokemonUseCase;

  late Pokemon _pokemon;

  late int _errorCode;

  int _selectedTabIndex = 0;

  String get pokemonImage => _pokemon.imageUrl;

  String get pokemonName => _pokemon.name.toUpperCase();

  int get pokemonIndex => _pokemon.index;

  int get selectedTabIndex => _selectedTabIndex;

  bool get isFavorite => _isFavoritePokemonUseCase(pokemonIndex);

  List<PokemonStat> get pokemonStats => _pokemon.stats;

  List<String> get pokemonTypeImages =>
      _pokemon.types.map((type) => _pokemonTypeImageMapper.map(type)).toList();

  Color get background => _pokemonTypeColorMapper.map(_pokemon.types[0]);

  void onInit(Pokemon pokemon) async {
    _pokemon = pokemon;
  }

  void setSelectedTab(int tabIndex) {
    _selectedTabIndex = tabIndex;
    notifyListener();
  }

  void _addFavoritePokemon() {
    final eitherPokemon = _addFavoritePokemonUseCase(_pokemon);

    if (eitherPokemon.isLeft()) {
      _errorCode = eitherPokemon.asLeft().errorId;
      setErrorState();
    }

    if (eitherPokemon.isRight()) {
      _pokemon = eitherPokemon.asRight();
      setSuccessState();
    }
  }

  void _removeFavoritePokemon() {
    final eitherPokemon = _removeFavoritePokemonUseCase(_pokemon);

    if (eitherPokemon.isLeft()) {
      _errorCode = eitherPokemon.asLeft().errorId;
      setErrorState();
    }

    if (eitherPokemon.isRight()) {
      _pokemon = eitherPokemon.asRight();
      setSuccessState();
    }
  }

  void toggleFavoritePokemon() {
    if (isFavorite) {
      _removeFavoritePokemon();
    } else {
      _addFavoritePokemon();
    }
    notifyListener();
  }
}
