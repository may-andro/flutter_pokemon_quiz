import 'package:domain/domain.dart';
import 'package:guess_pokemon/src/domain/fetch_random_pokemon_usecase.dart';
import 'package:guess_pokemon/src/domain/start_speech_to_text_usecase.dart';
import 'package:guess_pokemon/src/domain/stop_speech_to_text_usecase.dart';
import 'package:ui_core/ui_core.dart';

class GuessPokemonViewModel extends BaseViewModel {
  GuessPokemonViewModel(
    this._startSpeechToTextUseCase,
    this._stopSpeechToTextUseCase,
    this._fetchRandomPokemonUseCase,
  );

  final StartSpeechToTextUseCase _startSpeechToTextUseCase;
  final StopSpeechToTextUseCase _stopSpeechToTextUseCase;
  final FetchRandomPokemonUseCase _fetchRandomPokemonUseCase;

  late int _errorCode;
  Pokemon? _pokemon;
  bool _isListening = false;
  String _text = 'Press the button and speak';
  bool _isAnsweredCorrectly = false;

  String get text => _text;

  bool get isListening => _isListening;

  bool get isAnsweredCorrectly => _isAnsweredCorrectly;

  String get pokemonImage => _pokemon?.imageUrl ?? '';

  String get pokemonName => _pokemon?.name ?? '';

  void onInit() async {
    _startSpeechToTextUseCase.textStream.listen((text) {
      _text = text;
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
    _text = _pokemon?.name ?? 'Unknown';
    if(_isListening) {
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
