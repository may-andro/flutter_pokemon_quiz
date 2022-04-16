import 'package:domain/src/model/model.dart';
import 'package:domain/src/usecase/pokemon/fetch_captured_pokemons_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

import '../../mock/usecase/pokedex/mocked_fetch_pokedex_usecase.dart';

void main() {
  group(FetchCapturedPokemonsUseCase, () {
    late MockedFetchPokedexUseCase mockedFetchPokedexUseCase;

    late FetchCapturedPokemonsUseCase fetchCapturedPokemonsUseCase;

    setUp(() {
      mockedFetchPokedexUseCase = MockedFetchPokedexUseCase();

      fetchCapturedPokemonsUseCase = FetchCapturedPokemonsUseCase(
        mockedFetchPokedexUseCase,
      );
    });

    group('call', () {
      test('should return ${Right<Failure, List<Pokemon>>}', () async {
        const pokemon = Pokemon(
          index: 1,
          name: 'name',
          baseExperience: 1,
          weight: 1,
          height: 1,
          imageUrl: 'imageUrl',
          abilities: [],
          moves: [],
          types: [],
          stats: [],
          isFavorite: false,
          isCaptured: false,
        );
        const pokedex = Pokedex(pokemons: [pokemon]);
        mockedFetchPokedexUseCase.mockRightCall(pokedex);

        final result = await fetchCapturedPokemonsUseCase('');

        expect(result.isRight(), true);
        verify(
          () => mockedFetchPokedexUseCase.call(any()),
        ).called(1);
      });

      test('should throw $Exception', () async {
        mockedFetchPokedexUseCase.mockLeftCall(const Failure(1));

        final result = await fetchCapturedPokemonsUseCase('');

        expect(result.isLeft(), true);
        expect(result.asLeft(), const Failure(1));
      });
    });
  });
}
