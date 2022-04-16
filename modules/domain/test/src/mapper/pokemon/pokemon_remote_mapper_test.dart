import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network/network.dart';

import '../../mock/usecase/pokemon/mock_is_captured_pokemon_usecase.dart';
import '../../mock/usecase/pokemon/mocked_is_favorite_pokemon_usecase.dart';

void main() {
  group(PokemonRemoteMapper, () {
    late PokemonStatsRemoteMapper pokemonStatsRemoteMapper;
    late MockIsCapturedPokemonUseCase mockIsCapturedPokemonUseCase;
    late MockedIsFavoritePokemonUseCase mockIsFavoritePokemonUseCase;

    late PokemonRemoteMapper pokemonRemoteMapper;

    setUp(() {
      pokemonStatsRemoteMapper = PokemonStatsRemoteMapper();
      mockIsCapturedPokemonUseCase = MockIsCapturedPokemonUseCase();
      mockIsFavoritePokemonUseCase = MockedIsFavoritePokemonUseCase();

      pokemonRemoteMapper = PokemonRemoteMapper(
        pokemonStatsRemoteMapper,
        mockIsFavoritePokemonUseCase,
        mockIsCapturedPokemonUseCase,
      );
    });

    group('mapFromEntityToModel', () {
      test('should map $RemotePokemon to $Pokemon', () {
        const entity = RemotePokemon(
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
        );
        const model = Pokemon(
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
          isCaptured: false,
          isFavorite: true,
        );
        mockIsFavoritePokemonUseCase.mockCall(true);
        mockIsCapturedPokemonUseCase.mockCall(false);

        final result = pokemonRemoteMapper.mapFromEntityToModel(entity);

        expect(result, model);
      });
    });

    group('mapFromModelToEntity', () {
      test('should throw $UnimplementedError', () {
        const model = Pokemon(
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
          isCaptured: false,
          isFavorite: false,
        );

        expect(
          () => pokemonRemoteMapper.mapFromModelToEntity(model),
          throwsA(isA<UnimplementedError>()),
        );
      });
    });
  });
}
