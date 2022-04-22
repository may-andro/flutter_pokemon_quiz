import 'package:guess_pokemon/src/domain/stop_speech_to_text_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockedStopSpeechToTextUseCase extends Mock
    implements StopSpeechToTextUseCase {
  void mockCall() {
    when(call).thenReturn(null);
  }
}
