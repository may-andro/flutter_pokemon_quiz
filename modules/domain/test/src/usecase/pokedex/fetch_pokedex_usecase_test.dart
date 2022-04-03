import 'package:data/data.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network/network.dart';

import '../../mock/repository/pokedex/mocked_pokedex_repository.dart';

void main() {
  group(FetchPokedexUseCase, () {
    late MockedPokedexRepository mockedPokedexRepository;
    late PokemonStatsRemoteMapper pokemonStatsRemoteMapper;
    late PokemonRemoteMapper pokemonRemoteMapper;
    late PokedexRemoteMapper pokedexRemoteMapper;

    late FetchPokedexUseCase fetchPokedexUseCase;

    setUp(() {
      mockedPokedexRepository = MockedPokedexRepository();
      pokemonStatsRemoteMapper = PokemonStatsRemoteMapper();
      pokemonRemoteMapper = PokemonRemoteMapper(pokemonStatsRemoteMapper);
      pokedexRemoteMapper = PokedexRemoteMapper(pokemonRemoteMapper);

      fetchPokedexUseCase = FetchPokedexUseCase(
        mockedPokedexRepository,
        pokedexRemoteMapper,
      );
    });

    group('call', () {
      test(
          'should return $Right when $PokedexRepository '
          'returns valid $RemotePokedex', () async {
        const expected = RemotePokedex([
          RemotePokemon(
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
          )
        ]);
        mockedPokedexRepository.mockFetchPokedex(expected);

        final result = await fetchPokedexUseCase('');

        expect(result.isRight(), true);
        expect(
          result.asRight(),
          pokedexRemoteMapper.mapFromEntityToModel(expected),
        );
      });

      test(
          'should return $Left when $PokedexRepository '
          'throws exception', () async {
        mockedPokedexRepository.mockFetchPokedexException(Exception());

        final result = await fetchPokedexUseCase('');

        expect(result.isLeft(), true);
        expect(result.asLeft(), const Failure(ERROR_SERVER_ID));
      });
    });
  });
}
