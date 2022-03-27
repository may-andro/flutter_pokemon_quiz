import 'package:guess_pokemon/src/data/speech_text_repository.dart';

class StopSpeechToTextUseCase {
  StopSpeechToTextUseCase(this._speechTextRepository);

  final SpeechTextRepository _speechTextRepository;

  void call() {
    _speechTextRepository.stopSpeechText();
  }
}
