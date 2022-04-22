import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guess_pokemon/src/domain/fetch_random_pokemon_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../mock/usecase/mocked_fetch_pokedex_end_index_usecase.dart';
import '../../mock/usecase/mocked_fetch_pokedex_start_index_usecase.dart';
import '../../mock/usecase/mocked_fetch_pokemon_usecase.dart';
import '../../mock/usecase/mocked_random_number_generator_usecase.dart';
import '../../test_utils/test_data.dart';

void main() {
  group(FetchRandomPokemonUseCase, () {
    late MockedFetchPokemonUseCase mockedFetchPokemonUseCase;
    late MockedFetchPokedexEndIndexUseCase mockedFetchPokedexEndIndexUseCase;
    late MockedFetchPokedexStartIndexUseCase
        mockedFetchPokedexStartIndexUseCase;
    late MockedRandomNumberGeneratorUseCase mockedRandomNumberGeneratorUseCase;

    late FetchRandomPokemonUseCase fetchRandomPokemonUseCase;

    setUp(() {
      mockedFetchPokemonUseCase = MockedFetchPokemonUseCase();
      mockedFetchPokedexStartIndexUseCase =
          MockedFetchPokedexStartIndexUseCase();
      mockedFetchPokedexEndIndexUseCase = MockedFetchPokedexEndIndexUseCase();
      mockedRandomNumberGeneratorUseCase = MockedRandomNumberGeneratorUseCase();

      fetchRandomPokemonUseCase = FetchRandomPokemonUseCase(
        mockedFetchPokemonUseCase,
        mockedFetchPokedexStartIndexUseCase,
        mockedFetchPokedexEndIndexUseCase,
        mockedRandomNumberGeneratorUseCase,
      );
    });

    group('call', () {
      test(
          'should return ${Right<Failure, Pokemon>} '
          'when $FetchPokemonUseCase return ${Right<Failure, Pokemon>}',
          () async {
        mockedFetchPokedexStartIndexUseCase.mockCall(1);
        mockedFetchPokedexEndIndexUseCase.mockCall(2);
        mockedRandomNumberGeneratorUseCase.mockCall(1);
        mockedFetchPokemonUseCase.mockCall(
          const Right<Failure, Pokemon>(testPokemon),
        );

        final result = await fetchRandomPokemonUseCase.call();

        expect(result.isRight(), true);
        expect(result.asRight(), testPokemon);
      });

      test(
          'should return ${Left<Failure, Pokemon>} '
          'when $FetchPokemonUseCase return ${Left<Failure, Pokemon>}',
          () async {
        mockedFetchPokedexStartIndexUseCase.mockCall(1);
        mockedFetchPokedexEndIndexUseCase.mockCall(2);
        mockedRandomNumberGeneratorUseCase.mockCall(1);
        mockedFetchPokemonUseCase.mockCall(
          const Left<Failure, Pokemon>(Failure(1)),
        );

        final result = await fetchRandomPokemonUseCase.call();

        expect(result.isLeft(), true);
        expect(result.asLeft(), const Failure(1));
      });
    });
  });
}
