import 'dart:async';

import 'package:guess_pokemon/src/data/speech_text_repository.dart';

class StartSpeechToTextUseCase {
  StartSpeechToTextUseCase(this._speechTextRepository);

  final SpeechTextRepository _speechTextRepository;

  final StreamController<String> _textStreamController = StreamController();

  final StreamController<String> _statusStreamController = StreamController();

  Stream<String> get textStream => _textStreamController.stream;

  Stream<String> get statusStream => _statusStreamController.stream;

  void call() {
    _speechTextRepository.listenSpeech(onListenResult: (text) {
      _textStreamController.add(text);
    }, onListenStatus: (text) {
      _statusStreamController.add(text);
    });
  }

  void dispose() {
    _textStreamController.close();
    _statusStreamController.close();
  }
}
