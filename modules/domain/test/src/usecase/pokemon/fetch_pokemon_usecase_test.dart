import 'package:data/data.dart';
import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network/network.dart';
import 'package:dartz/dartz.dart';

import '../../mock/repository/pokemon/mocked_pokemon_repository.dart';

void main() {
  group(FetchPokemonUseCase, () {
    late MockedPokemonRepository mockedPokemonRepository;
    late ExtendedPokemonRemoteMapper extendedPokemonRemoteMapper;

    late FetchPokemonUseCase fetchPokemonUseCase;

    setUp(() {
      mockedPokemonRepository = MockedPokemonRepository();
      extendedPokemonRemoteMapper = ExtendedPokemonRemoteMapper();

      fetchPokemonUseCase = FetchPokemonUseCase(
        mockedPokemonRepository,
        extendedPokemonRemoteMapper,
      );
    });

    group('call', () {
      test('should return ${Right<Failure, Pokemon>}', () async {
        final expected = RemoteExtendedPokemon(
          1,
          'name',
          12,
          56,
          32,
          [],
          [],
          null,
          [],
          [],
        );
        mockedPokemonRepository.mockFetchPokemon(expected);

        final result = await fetchPokemonUseCase(1);

        expect(result.isRight(), true);
        expect(
          result.asRight(),
          const Pokemon(
            index: 1,
            name: 'name',
            baseExperience: 12,
            weight: 32,
            height: 56,
            imageUrl: '',
            stats: [],
            types: [],
            moves: [],
            abilities: [],
          ),
        );
      });

      test(
          'should return ${Left<Failure, Pokemon>} when '
          '$PokemonRepository throw exception', () async {
        mockedPokemonRepository.mockFetchPokemonThrowsException();

        final result = await fetchPokemonUseCase(1);

        expect(result.isLeft(), true);
        expect(result.asLeft(), const Failure(ERROR_SERVER_ID));
      });
    });
  });
}
