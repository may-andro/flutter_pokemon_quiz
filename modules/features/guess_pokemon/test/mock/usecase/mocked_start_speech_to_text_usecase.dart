import 'package:guess_pokemon/src/domain/start_speech_to_text_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockedStartSpeechToTextUseCase extends Mock
    implements StartSpeechToTextUseCase {
  void mockTextStream(String expected) {
    when(() => textStream).thenAnswer((_) => Stream.value(expected));
  }

  void mockStatusStream(String expected) {
    when(() => statusStream).thenAnswer((_) => Stream.value(expected));
  }
}
