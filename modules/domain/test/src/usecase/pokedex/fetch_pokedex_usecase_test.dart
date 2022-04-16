import 'package:data/data.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/src/model/model.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

import '../../mock/mapper/pokedex/mock_pokedex_remote_mapper.dart';
import '../../mock/repository/pokedex/mocked_pokedex_repository.dart';

void main() {
  group(FetchPokedexUseCase, () {
    setUpAll(() {
      registerFallbackValue(
        const RemotePokedex([
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
        ]),
      );
    });

    late MockedPokedexRepository mockedPokedexRepository;
    late MockPokedexRemoteMapper mockPokedexRemoteMapper;

    late FetchPokedexUseCase fetchPokedexUseCase;

    setUp(() {
      mockedPokedexRepository = MockedPokedexRepository();
      mockPokedexRemoteMapper = MockPokedexRemoteMapper();

      fetchPokedexUseCase = FetchPokedexUseCase(
        mockedPokedexRepository,
        mockPokedexRemoteMapper,
      );
    });

    group('call', () {
      test(
          'should return $Right when $PokedexRepository '
          'returns valid $RemotePokedex', () async {
        const remotePokedex = RemotePokedex([
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
        const pokedex = Pokedex(
          pokemons: [
            Pokemon(
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
              isCaptured: true,
              isFavorite: false,
            )
          ],
        );
        mockedPokedexRepository.mockFetchPokedex(remotePokedex);
        mockPokedexRemoteMapper.mockMapFromEntityToModel(pokedex);

        final result = await fetchPokedexUseCase('');

        expect(result.isRight(), true);
        expect(
          result.asRight(),
          pokedex,
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
