import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guess_pokemon/src/domain/fetch_random_pokemon_usecase.dart';
import 'package:guess_pokemon/src/domain/start_speech_to_text_usecase.dart';
import 'package:guess_pokemon/src/domain/stop_speech_to_text_usecase.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ui_core/ui_core.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_async/fake_async.dart';

import '../../../mock/usecase/mocked_capture_pokemon_usecase.dart';
import '../../../mock/usecase/mocked_fetch_random_pokemon_usecase.dart';
import '../../../mock/usecase/mocked_is_feature_enabled_usecase.dart';
import '../../../mock/usecase/mocked_start_speech_to_text_usecase.dart';
import '../../../mock/usecase/mocked_stop_speech_to_text_usecase.dart';
import '../../../test_utils/test_data.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(testPokemon);
  });

  group(GuessPokemonViewModel, () {
    late MockedStartSpeechToTextUseCase mockedStartSpeechToTextUseCase;
    late MockedStopSpeechToTextUseCase mockedStopSpeechToTextUseCase;
    late MockedFetchRandomPokemonUseCase mockedFetchRandomPokemonUseCase;
    late MockedIsFeatureEnabledUseCase mockedIsFeatureEnabledUseCase;
    late PokemonTypeColorMapper pokemonTypeColorMapper;
    late MockedCapturePokemonUseCase mockedCapturePokemonUseCase;

    late GuessPokemonViewModel guessPokemonViewModel;

    setUp(() {
      mockedStartSpeechToTextUseCase = MockedStartSpeechToTextUseCase();
      mockedStopSpeechToTextUseCase = MockedStopSpeechToTextUseCase();
      mockedFetchRandomPokemonUseCase = MockedFetchRandomPokemonUseCase();
      mockedIsFeatureEnabledUseCase = MockedIsFeatureEnabledUseCase();
      pokemonTypeColorMapper = PokemonTypeColorMapper();
      mockedCapturePokemonUseCase = MockedCapturePokemonUseCase();

      guessPokemonViewModel = GuessPokemonViewModel(
        mockedStartSpeechToTextUseCase,
        mockedStopSpeechToTextUseCase,
        mockedFetchRandomPokemonUseCase,
        mockedIsFeatureEnabledUseCase,
        pokemonTypeColorMapper,
        mockedCapturePokemonUseCase,
      );
    });

    tearDown(() {
      mockedStartSpeechToTextUseCase.dispose();
    });

    group('onInit', () {
      test('should call $FetchRandomPokemonUseCase', () {
        mockedStartSpeechToTextUseCase.mockStatusStream('close');
        mockedStartSpeechToTextUseCase.mockTextStream('');
        mockedFetchRandomPokemonUseCase.mockCall(
          const Right<Failure, Pokemon>(testPokemon),
        );

        fakeAsync<dynamic>((async) {
          guessPokemonViewModel.onInit();
          async.flushMicrotasks();
        });

        verify(mockedFetchRandomPokemonUseCase.call).called(1);
      });

      test(
          'should set Pokemon when '
          '$FetchRandomPokemonUseCase return ${Right<Failure, Pokemon>}', () {
        mockedStartSpeechToTextUseCase.mockStatusStream('close');
        mockedStartSpeechToTextUseCase.mockTextStream('');
        mockedFetchRandomPokemonUseCase.mockCall(
          const Right<Failure, Pokemon>(testPokemon),
        );

        fakeAsync<dynamic>((async) {
          guessPokemonViewModel.onInit();
          async.flushMicrotasks();
        });

        expect(guessPokemonViewModel.pokemon, testPokemon);
      });

      test(
          'should not set Pokemon when '
          '$FetchRandomPokemonUseCase return ${Left<Failure, Pokemon>}', () {
        mockedStartSpeechToTextUseCase.mockStatusStream('close');
        mockedStartSpeechToTextUseCase.mockTextStream('');
        mockedFetchRandomPokemonUseCase.mockCall(
          const Left<Failure, Pokemon>(Failure(1)),
        );

        fakeAsync<dynamic>((async) {
          guessPokemonViewModel.onInit();
          async.flushMicrotasks();
        });

        expect(guessPokemonViewModel.pokemon, null);
      });

      test('should set isListening true when status is listening', () async {
        mockedStartSpeechToTextUseCase.mockStatusStream('listening');
        mockedStartSpeechToTextUseCase.mockTextStream('');
        mockedFetchRandomPokemonUseCase.mockCall(
          const Right<Failure, Pokemon>(testPokemon),
        );

        fakeAsync<dynamic>((async) {
          guessPokemonViewModel.onInit();
          async.flushMicrotasks();
        });

        expect(guessPokemonViewModel.isListening, isTrue);
      });

      test('should set isListening false when status is not listening',
          () async {
        mockedStartSpeechToTextUseCase.mockStatusStream('close');
        mockedStartSpeechToTextUseCase.mockTextStream('');
        mockedFetchRandomPokemonUseCase.mockCall(
          const Right<Failure, Pokemon>(testPokemon),
        );

        fakeAsync<dynamic>((async) {
          guessPokemonViewModel.onInit();
          async.flushMicrotasks();
        });

        expect(guessPokemonViewModel.isListening, isFalse);
      });

      test('should call $StopSpeechToTextUseCase when status is not listening',
          () async {
        mockedStartSpeechToTextUseCase.mockStatusStream('close');
        mockedStartSpeechToTextUseCase.mockTextStream('');
        mockedFetchRandomPokemonUseCase.mockCall(
          const Right<Failure, Pokemon>(testPokemon),
        );

        fakeAsync<dynamic>((async) {
          guessPokemonViewModel.onInit();
          async.flushMicrotasks();
        });

        verify(mockedStopSpeechToTextUseCase.call).called(1);
      });

      test(
          'should set isAnsweredCorrectly true when '
          'pokemon name is equal as speech to text stream', () {
        mockedStartSpeechToTextUseCase.mockStatusStream('');
        mockedStartSpeechToTextUseCase.mockTextStream(testPokemon.name);
        mockedFetchRandomPokemonUseCase.mockCall(
          const Right<Failure, Pokemon>(testPokemon),
        );
        mockedCapturePokemonUseCase.mockCall(
          const Right<Failure, Pokemon>(testPokemon),
        );

        fakeAsync<dynamic>((async) {
          guessPokemonViewModel.onInit();
          async.flushMicrotasks();
        });

        expect(guessPokemonViewModel.isAnsweredCorrectly, isTrue);
      });

      test(
          'should set isAnsweredCorrectly false when '
          'pokemon name is not equal as speech to text stream', () {
        mockedStartSpeechToTextUseCase.mockStatusStream('');
        mockedStartSpeechToTextUseCase.mockTextStream('some other pokemon');
        mockedFetchRandomPokemonUseCase.mockCall(
          const Right<Failure, Pokemon>(testPokemon),
        );
        mockedCapturePokemonUseCase.mockCall(
          const Right<Failure, Pokemon>(testPokemon),
        );

        fakeAsync<dynamic>((async) {
          guessPokemonViewModel.onInit();
          async.flushMicrotasks();
        });

        expect(guessPokemonViewModel.isAnsweredCorrectly, isFalse);
      });

      test('should not call $CapturePokemonUseCase when pokemon is null', () {
        mockedStartSpeechToTextUseCase.mockStatusStream('');
        mockedStartSpeechToTextUseCase.mockTextStream(testPokemon.name);
        mockedFetchRandomPokemonUseCase.mockCall(
          const Left<Failure, Pokemon>(Failure(1)),
        );

        fakeAsync<dynamic>((async) {
          guessPokemonViewModel.onInit();
          async.flushMicrotasks();
        });

        verifyNever(() => mockedCapturePokemonUseCase.call(any()));
      });

      test(
          'should set pokemon when '
          '$CapturePokemonUseCase has ${Right<Failure, Pokemon>}', () {
        mockedStartSpeechToTextUseCase.mockStatusStream('');
        mockedStartSpeechToTextUseCase.mockTextStream(testPokemon.name);
        mockedFetchRandomPokemonUseCase.mockCall(
          const Right<Failure, Pokemon>(testPokemon),
        );
        mockedCapturePokemonUseCase.mockCall(
          const Right<Failure, Pokemon>(testPokemon),
        );

        fakeAsync<dynamic>((async) {
          guessPokemonViewModel.onInit();
          async.flushMicrotasks();
        });

        expect(guessPokemonViewModel.pokemon, testPokemon);
      });
    });

    group('listenToSpeech', () {
      test('should call $StartSpeechToTextUseCase when isListening is false',
          () async {
        mockedStartSpeechToTextUseCase.mockStatusStream('close');
        mockedStartSpeechToTextUseCase.mockTextStream('');
        mockedFetchRandomPokemonUseCase.mockCall(
          const Right<Failure, Pokemon>(testPokemon),
        );

        await guessPokemonViewModel.onInit();
        guessPokemonViewModel.listenToSpeech();

        verify(mockedStartSpeechToTextUseCase.call).called(1);
      });

      test('should set isListening to false when isListening is true',
          () async {
        mockedStartSpeechToTextUseCase.mockStatusStream('close');
        mockedStartSpeechToTextUseCase.mockTextStream('');
        mockedFetchRandomPokemonUseCase.mockCall(
          const Right<Failure, Pokemon>(testPokemon),
        );

        fakeAsync<dynamic>((async) {
          guessPokemonViewModel.onInit();
          async.flushMicrotasks();
        });
        guessPokemonViewModel.listenToSpeech();

        expect(guessPokemonViewModel.isListening, isFalse);
      });

      test('should call $StopSpeechToTextUseCase when isListening is true',
          () async {
        mockedStartSpeechToTextUseCase.mockStatusStream('listening');
        mockedStartSpeechToTextUseCase.mockTextStream('');
        mockedFetchRandomPokemonUseCase.mockCall(
          const Right<Failure, Pokemon>(testPokemon),
        );

        fakeAsync<dynamic>((async) {
          guessPokemonViewModel.onInit();
          async.flushMicrotasks();
        });
        guessPokemonViewModel.listenToSpeech();

        verify(mockedStopSpeechToTextUseCase.call).called(1);
      });
    });

    group('loadPokemon', () {
      test('should call $StopSpeechToTextUseCase', () async {
        mockedStartSpeechToTextUseCase.mockStatusStream('listening');
        mockedStartSpeechToTextUseCase.mockTextStream(testPokemon.name);
        mockedFetchRandomPokemonUseCase.mockCall(
          const Right<Failure, Pokemon>(testPokemon),
        );
        mockedCapturePokemonUseCase.mockCall(
          const Right<Failure, Pokemon>(testPokemon),
        );

        fakeAsync<dynamic>((async) {
          guessPokemonViewModel.onInit();
          async.flushMicrotasks();
        });

        await guessPokemonViewModel.loadPokemon();

        verify(mockedStopSpeechToTextUseCase).called(1);
      });

      test('should set isAnsweredCorrectly to false', () async {
        mockedFetchRandomPokemonUseCase.mockCall(
          const Right<Failure, Pokemon>(testPokemon),
        );

        await guessPokemonViewModel.loadPokemon();

        expect(guessPokemonViewModel.isAnsweredCorrectly, isFalse);
      });

      test('should call $FetchRandomPokemonUseCase', () async {
        mockedFetchRandomPokemonUseCase.mockCall(
          const Right<Failure, Pokemon>(testPokemon),
        );

        await guessPokemonViewModel.loadPokemon();

        verify(mockedFetchRandomPokemonUseCase).called(1);
      });

      test(
          'should set ${ViewState.error} when '
          '$FetchRandomPokemonUseCase return ${Left<Failure, Pokemon>}',
          () async {
        mockedFetchRandomPokemonUseCase.mockCall(
          const Left<Failure, Pokemon>(Failure(1)),
        );

        await guessPokemonViewModel.loadPokemon();

        expect(guessPokemonViewModel.viewState, ViewState.error);
      });

      test(
          'should set ${ViewState.success} when '
          '$FetchRandomPokemonUseCase return ${Right<Failure, Pokemon>}',
          () async {
        mockedFetchRandomPokemonUseCase.mockCall(
          const Right<Failure, Pokemon>(testPokemon),
        );

        await guessPokemonViewModel.loadPokemon();

        expect(guessPokemonViewModel.viewState, ViewState.success);
      });

      test(
          'should set pokemon when '
          '$FetchRandomPokemonUseCase return ${Right<Failure, Pokemon>}',
          () async {
        mockedFetchRandomPokemonUseCase.mockCall(
          const Right<Failure, Pokemon>(testPokemon),
        );

        await guessPokemonViewModel.loadPokemon();

        expect(guessPokemonViewModel.pokemon, testPokemon);
      });
    });

    group('viewPokemon', () {
      test('should call $StopSpeechToTextUseCase', () {
        mockedCapturePokemonUseCase.mockCall(
          const Right<Failure, Pokemon>(testPokemon),
        );

        guessPokemonViewModel.viewPokemon();

        verify(mockedStopSpeechToTextUseCase.call).called(1);
      });

      test('should set isAnsweredCorrectly to true', () {
        guessPokemonViewModel.viewPokemon();

        expect(guessPokemonViewModel.isAnsweredCorrectly, isTrue);
      });

      test('should call $CapturePokemonUseCase', () {
        mockedStartSpeechToTextUseCase.mockStatusStream('');
        mockedStartSpeechToTextUseCase.mockTextStream(testPokemon.name);
        mockedFetchRandomPokemonUseCase.mockCall(
          const Right<Failure, Pokemon>(testPokemon),
        );
        mockedCapturePokemonUseCase.mockCall(
          const Right<Failure, Pokemon>(testPokemon),
        );

        fakeAsync<dynamic>((async) {
          guessPokemonViewModel.onInit();
          async.flushMicrotasks();
        });

        verify(() => mockedCapturePokemonUseCase.call(testPokemon)).called(1);

        guessPokemonViewModel.viewPokemon();

        verify(() => mockedCapturePokemonUseCase.call(testPokemon)).called(1);
        expect(guessPokemonViewModel.pokemon, testPokemon);
      });
    });
  });
}
