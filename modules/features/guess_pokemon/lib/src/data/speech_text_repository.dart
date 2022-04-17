import 'package:speech_to_text/speech_to_text.dart';

class SpeechTextRepository {
  SpeechTextRepository(this._speechToText);

  final SpeechToText _speechToText;

  bool get _isListening => _speechToText.isListening;

  bool stopSpeechText() {
    if (_isListening) {
      _speechToText.stop();
      return true;
    }
    return false;
  }

  void listenSpeech({
    required Function(String text) onListenResult,
    required Function(String status) onListenStatus,
  }) async {
    final isStopped = stopSpeechText();
    if (isStopped) return;

    final isAvailable = await _speechToText.initialize(
      onStatus: (status) => onListenStatus(status),
      onError: (error) => onListenResult(error.errorMsg),
    );

    if (isAvailable) {
      _speechToText.listen(
        onResult: (value) => onListenResult(value.recognizedWords),
      );
    }
  }
}
