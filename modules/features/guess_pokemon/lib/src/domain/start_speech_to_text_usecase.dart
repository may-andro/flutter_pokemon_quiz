import 'dart:async';

import 'package:guess_pokemon/src/data/speech_text_repository.dart';

class StartSpeechToTextUseCase {
  StartSpeechToTextUseCase(this._speechTextRepository);

  final SpeechTextRepository _speechTextRepository;

  Stream<String> get textStream => _streamController.stream;

  final StreamController<String> _streamController = StreamController();

  void call() {
    _speechTextRepository.listenSpeech(onListenResult: (text) {
      _streamController.add(text);
    });
  }

  void dispose() {
    _streamController.close();
  }
}
