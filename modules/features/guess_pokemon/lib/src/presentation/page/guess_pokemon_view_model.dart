import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:guess_pokemon/src/domain/fetch_random_pokemon_usecase.dart';
import 'package:guess_pokemon/src/domain/start_speech_to_text_usecase.dart';
import 'package:guess_pokemon/src/domain/stop_speech_to_text_usecase.dart';
import 'package:ui_core/ui_core.dart';

class GuessPokemonViewModel extends BaseViewModel {
  GuessPokemonViewModel(
    this._startSpeechToTextUseCase,
    this._stopSpeechToTextUseCase,
    this._fetchRandomPokemonUseCase,
    this._isFeatureEnabledUseCase,
    this._pokemonTypeColorMapper,
  );

  final StartSpeechToTextUseCase _startSpeechToTextUseCase;
  final StopSpeechToTextUseCase _stopSpeechToTextUseCase;
  final FetchRandomPokemonUseCase _fetchRandomPokemonUseCase;
  final IsFeatureEnabledUseCase _isFeatureEnabledUseCase;
  final PokemonTypeColorMapper _pokemonTypeColorMapper;

  late int _errorCode;
  Pokemon? _pokemon;
  bool _isListening = false;
  String _text = 'Press the button and speak';
  bool _isAnsweredCorrectly = false;

  String get text => _text;

  bool get isListening => _isListening;

  bool get isAnsweredCorrectly => _isAnsweredCorrectly;

  String get pokemonImage => _pokemon?.imageUrl ?? '';

  String get pokemonName => _pokemon?.name.toUpperCase() ?? '';

  Pokemon? get pokemon => _pokemon;

  Color get typeColor => _pokemonTypeColorMapper.map(_pokemon?.types[0] ?? '');

  bool get isPokemonDetailFeatureEnabled =>
      _isFeatureEnabledUseCase(Feature.pokemon_detail);

  bool get isPokedexFeatureEnabled => _isFeatureEnabledUseCase(Feature.pokedex);

  void onInit() async {
    _startSpeechToTextUseCase.textStream.listen((text) {
      _text = text.toUpperCase();
      _isAnsweredCorrectly = _text.toUpperCase() == pokemonName.toUpperCase();
      _isListening = false;
      notifyListener();
    });

    await loadPokemon();
  }

  void listenToSpeech() {
    if (!_isListening) {
      _isListening = true;
      _listenSpeechService();
    } else {
      _isListening = false;
      _stopSpeechService();
    }
    notifyListener();
  }

  Future<void> loadPokemon() async {
    final pokemon = await _fetchRandomPokemonUseCase.call();

    _text = 'Press the button and speak';
    _isListening = false;
    _isAnsweredCorrectly = false;

    if (pokemon.isLeft()) {
      _errorCode = pokemon.asLeft().errorId;

      //DO ERROR Mech for correct strings
      _text = 'Failed to fetch pokemon $_errorCode';
      setErrorState();
    }

    if (pokemon.isRight()) {
      _pokemon = pokemon.asRight();
      setSuccessState();
    }
  }

  void viewPokemon() {
    _text = _pokemon?.name.toUpperCase() ?? 'Unknown';
    if (_isListening) {
      _stopSpeechService();
      _isListening = false;
    }
    _isAnsweredCorrectly = true;
    notifyListener();
  }

  void _listenSpeechService() {
    _startSpeechToTextUseCase();
  }

  void _stopSpeechService() {
    _stopSpeechToTextUseCase();
  }

  @override
  void dispose() {
    super.dispose();
    _startSpeechToTextUseCase.dispose();
  }
}
