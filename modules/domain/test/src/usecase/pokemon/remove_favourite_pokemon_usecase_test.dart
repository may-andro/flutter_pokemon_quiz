import 'package:data/data.dart';
import 'package:domain/src/model/model.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';

import '../../mock/repository/pokemon/mocked_pokemon_repository.dart';

void main() {
  group(RemoveFavoritePokemonUseCase, () {
    late MockedPokemonRepository mockedPokemonRepository;

    late RemoveFavoritePokemonUseCase removeFavouritePokemonUseCase;

    setUp(() {
      mockedPokemonRepository = MockedPokemonRepository();

      removeFavouritePokemonUseCase = RemoveFavoritePokemonUseCase(
        mockedPokemonRepository,
      );
    });

    group('call', () {
      test('should return ${Left<Failure, void>}', () {
        final result = removeFavouritePokemonUseCase(1);

        expect(result.isRight(), true);
      });

      test(
          'should return ${Left<Failure, void>} when '
          '$PokemonRepository throw exception', () {
        mockedPokemonRepository.mockRemovePokemonThrowException();

        final result = removeFavouritePokemonUseCase(1);

        expect(result.isLeft(), true);
        expect(result.asLeft(), const Failure(ERROR_DB_ID));
      });
    });
  });
}
