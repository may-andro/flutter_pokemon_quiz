import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/src/presentation/pages/pokedex_view_model.dart';
import 'package:ui_core/ui_core.dart';
import 'package:dartz/dartz.dart';

import '../mock/usecase/mocked_fetch_pokedex_usecase.dart';
import '../test_utils/test_data.dart';

void main() {
  group(PokedexViewModel, () {
    late MockedFetchPokedexUseCase mockedFetchPokedexUseCase;
    late BuildConfig buildConfig;

    late PokedexViewModel pokedexViewModel;

    setUp(() {
      mockedFetchPokedexUseCase = MockedFetchPokedexUseCase();
      buildConfig = BuildConfig(
        buildFlavor: BuildFlavor.jhoto,
        buildEnvironment: BuildEnvironment.debug,
      );

      pokedexViewModel = PokedexViewModel(
        mockedFetchPokedexUseCase,
        buildConfig,
      );
    });

    tearDown(() => pokedexViewModel.dispose());

    group('onInit', () {
      test('should call $FetchPokedexUseCase', () {
        mockedFetchPokedexUseCase.mockCall(
          const Right<Failure, List<Pokemon>>(testPokedex),
        );

        pokedexViewModel.onInit();

        verify(
          () => mockedFetchPokedexUseCase.call(buildConfig.buildFlavor.name),
        ).called(1);
      });

      test(
          'should show ${ViewState.error} '
          'when $FetchPokedexUseCase return ${Left<Failure, List<Pokemon>>}',
          () async {
        mockedFetchPokedexUseCase.mockCall(
          const Left<FetchPokedexUseCaseFailure, List<Pokemon>>(
              FetchPokedexUseCaseFailure.server()),
        );

        await pokedexViewModel.onInit();

        expect(pokedexViewModel.errorMessage,
            'Failed to fetch pokedex due to server error');
      });

      test(
          'should show ${ViewState.success} '
          'when $FetchPokedexUseCase return ${Right<Failure, List<Pokemon>>}',
          () async {
        mockedFetchPokedexUseCase.mockCall(
          const Right<Failure, List<Pokemon>>(testPokedex),
        );

        await pokedexViewModel.onInit();

        expect(pokedexViewModel.pokemons, testPokedex);
      });
    });
  });
}
