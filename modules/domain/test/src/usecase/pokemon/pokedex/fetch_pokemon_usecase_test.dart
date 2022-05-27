import 'package:domain/src/model/model.dart';
import 'package:domain/src/repository/pokemon/pokemon_repository.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';

import '../../../fake/repository/pokemon/fake_pokemon_repository.dart';

void main() {
  group(FetchPokemonUseCase, () {
    late PokemonRepository pokemonRepository;

    late FetchPokemonUseCase fetchPokemonUseCase;

    setUp(() {
      pokemonRepository = FakePokemonRepository();

      fetchPokemonUseCase = FetchPokemonUseCase(pokemonRepository);
    });

    group('call', () {
      test('should return ${Right<Failure, Pokemon>}', () async {
        final result = await fetchPokemonUseCase(1);

        expect(result.isRight(), true);
      });

      test(
          'should return ${Left<Failure, Pokemon>} when '
          '$PokemonRepository throw exception', () async {
        final result = await fetchPokemonUseCase(1111);

        expect(result.isLeft(), true);
      });
    });
  });
}
