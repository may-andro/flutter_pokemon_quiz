import 'package:data/data.dart';
import 'package:domain/src/model/model.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';
import 'package:dartz/dartz.dart';

import '../../mock/repository/pokemon/mocked_pokemon_repository.dart';
import '../../mock/usecase/pokemon/mocked_extended_pokemon_remote_mapper.dart';

void main() {
  group(FetchPokemonUseCase, () {
    setUpAll(() {
      registerFallbackValue(RemoteExtendedPokemon(
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
      ));
    });

    late MockedPokemonRepository mockedPokemonRepository;
    late MockedExtendedPokemonRemoteMapper mockedExtendedPokemonRemoteMapper;

    late FetchPokemonUseCase fetchPokemonUseCase;

    setUp(() {
      mockedPokemonRepository = MockedPokemonRepository();
      mockedExtendedPokemonRemoteMapper = MockedExtendedPokemonRemoteMapper();

      fetchPokemonUseCase = FetchPokemonUseCase(
        mockedPokemonRepository,
        mockedExtendedPokemonRemoteMapper,
      );
    });

    group('call', () {
      test('should return ${Right<Failure, Pokemon>}', () async {
        final remoteExtendedPokemon = RemoteExtendedPokemon(
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
        const pokemon = Pokemon(
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
          isCaptured: true,
          isFavorite: true,
        );
        mockedPokemonRepository.mockFetchPokemon(remoteExtendedPokemon);
        mockedExtendedPokemonRemoteMapper.mockMapFromEntityToModel(pokemon);

        final result = await fetchPokemonUseCase(1);

        expect(result.isRight(), true);
        expect(
          result.asRight(),
          pokemon,
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
