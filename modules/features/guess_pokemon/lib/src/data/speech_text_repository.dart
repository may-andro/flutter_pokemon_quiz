import 'package:speech_to_text/speech_to_text.dart';

class SpeechTextRepository {
  final SpeechToText _speechToText;

  SpeechTextRepository(this._speechToText);

  bool get _isListening => _speechToText.isListening;

  Future<bool> _initSpeechText() async {
    return _speechToText.initialize(
      onStatus: (status) => print('onStatus: $status'),
      onError: (error) => print('Error: $error'),
    );
  }

  bool stopSpeechText() {
    if (_isListening) {
      _speechToText.stop();
      return true;
    }
    return false;
  }

  void listenSpeech({
    required Function(String text) onListenResult,
  }) async {
    final isStopped = stopSpeechText();
    if (isStopped) return;

    final isAvailable = await _initSpeechText();

    if (isAvailable) {
      _speechToText.listen(
        onResult: (value) => onListenResult(value.recognizedWords),
      );
    }
  }
}
