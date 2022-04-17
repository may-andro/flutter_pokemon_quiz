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
    this._capturePokemonUseCase,
  );

  final StartSpeechToTextUseCase _startSpeechToTextUseCase;
  final StopSpeechToTextUseCase _stopSpeechToTextUseCase;
  final FetchRandomPokemonUseCase _fetchRandomPokemonUseCase;
  final IsFeatureEnabledUseCase _isFeatureEnabledUseCase;
  final PokemonTypeColorMapper _pokemonTypeColorMapper;
  final CapturePokemonUseCase _capturePokemonUseCase;

  late int _errorCode;
  Pokemon? _pokemon;
  bool _isListening = false;
  String _statusLabel = 'Press the button and speak';
  bool _isAnsweredCorrectly = false;

  String get statusLabel => _statusLabel;

  bool get isListening => _isListening;

  bool get isAnsweredCorrectly => _isAnsweredCorrectly;

  String get pokemonImage => _pokemon?.imageUrl ?? '';

  String get pokemonName => _pokemon?.name.toUpperCase() ?? '';

  Pokemon? get pokemon => _pokemon;

  Color get pokemonTypeColor =>
      _pokemonTypeColorMapper.map(_pokemon?.types[0] ?? '');

  bool get isPokemonDetailFeatureEnabled =>
      _isFeatureEnabledUseCase(Feature.pokemon_detail);

  void onInit() async {
    _startSpeechToTextUseCase.textStream.listen((text) {
      _statusLabel = text.toUpperCase().replaceAll('-', '');
      _isAnsweredCorrectly =
          _statusLabel.toUpperCase() == pokemonName.toUpperCase();
      if (_isAnsweredCorrectly) {
        final eitherPokemon = _capturePokemonUseCase.call(_pokemon!);
        if (eitherPokemon.isLeft()) {
          _errorCode = eitherPokemon.asLeft().errorId;
        }

        if (eitherPokemon.isRight()) {
          _pokemon = eitherPokemon.asRight();
        }
      }
      notifyListener();
    });

    _startSpeechToTextUseCase.statusStream.listen((status) {
      if (status == 'listening') {
        _isListening = true;
      } else {
        _stopSpeechService();
      }
      notifyListener();
    });

    await loadPokemon();
  }

  void listenToSpeech() {
    if (!_isListening) {
      _listenSpeechService();
    } else {
      _stopSpeechService();
    }
  }

  Future<void> loadPokemon() async {
    setLoadingState();

    _statusLabel = 'Fetching Pokemon!';
    _stopSpeechService();
    _isAnsweredCorrectly = false;

    final pokemon = await _fetchRandomPokemonUseCase.call();

    if (pokemon.isLeft()) {
      _errorCode = pokemon.asLeft().errorId;
      //DO ERROR Mech for correct strings
      _statusLabel = 'Failed to fetch pokemon $_errorCode';
      setErrorState();
    }

    if (pokemon.isRight()) {
      _statusLabel = 'Press the button and speak';
      _pokemon = pokemon.asRight();
      setSuccessState();
    }
  }

  void viewPokemon() {
    _statusLabel = _pokemon?.name.toUpperCase() ?? 'Unknown';
    _stopSpeechService();
    _isAnsweredCorrectly = true;

    final eitherPokemon = _capturePokemonUseCase.call(_pokemon!);
    if (eitherPokemon.isLeft()) {
      _errorCode = eitherPokemon.asLeft().errorId;
    }

    if (eitherPokemon.isRight()) {
      _pokemon = eitherPokemon.asRight();
    }

    notifyListener();
  }

  void _listenSpeechService() {
    _startSpeechToTextUseCase();
  }

  void _stopSpeechService() {
    _isListening = false;
    _stopSpeechToTextUseCase();
  }

  @override
  void dispose() {
    super.dispose();
    _startSpeechToTextUseCase.dispose();
  }
}
