import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:guess_pokemon/src/data/speech_text_repository.dart';
import 'package:guess_pokemon/src/domain/fetch_random_pokemon_usecase.dart';
import 'package:guess_pokemon/src/domain/random_number_generator_usecase.dart';
import 'package:guess_pokemon/src/domain/start_speech_to_text_usecase.dart';
import 'package:guess_pokemon/src/domain/stop_speech_to_text_usecase.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:ui_core/ui_core.dart';

void setupFeatureDependencies(final GetIt getIt) {
  _injectSpeechText(getIt);
  _injectSpeechRepository(getIt);
  _injectUseCase(getIt);
  _injectViewModel(getIt);
}

void _injectSpeechText(final GetIt getIt) {
  getIt.registerLazySingleton(() => SpeechToText());
}

void _injectSpeechRepository(final GetIt getIt) {
  getIt.registerLazySingleton(
    () => SpeechTextRepository(getIt.get<SpeechToText>()),
  );
}

void _injectUseCase(final GetIt getIt) {
  getIt.registerFactory(
    () => RandomNumberGeneratorUseCase(),
  );
  getIt.registerFactory(
    () => StopSpeechToTextUseCase(getIt.get<SpeechTextRepository>()),
  );
  getIt.registerFactory(
    () => StartSpeechToTextUseCase(getIt.get<SpeechTextRepository>()),
  );
  getIt.registerFactory(
    () => FetchRandomPokemonUseCase(
      getIt.get<FetchPokemonUseCase>(),
      getIt.get<FetchPokedexStartIndexUseCase>(),
      getIt.get<FetchPokedexEndIndexUseCase>(),
      getIt.get<RandomNumberGeneratorUseCase>(),
    ),
  );
}

void _injectViewModel(final GetIt getIt) {
  getIt.registerFactory(
    () => GuessPokemonViewModel(
      getIt.get<StartSpeechToTextUseCase>(),
      getIt.get<StopSpeechToTextUseCase>(),
      getIt.get<FetchRandomPokemonUseCase>(),
      getIt.get<IsFeatureEnabledUseCase>(),
      getIt.get<PokemonTypeColorMapper>(),
      getIt.get<CapturePokemonUseCase>(),
    ),
  );
}
