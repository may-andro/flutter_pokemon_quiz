import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network/network.dart';

import '../../mock/usecase/pokemon/mock_is_captured_pokemon_usecase.dart';
import '../../mock/usecase/pokemon/mock_is_favorite_pokemon_usecase.dart';

void main() {
  group(ExtendedPokemonRemoteMapper, () {
    late ExtendedPokemonRemoteMapper extendedPokemonRemoteMapper;
    late MockIsCapturedPokemonUseCase mockIsCapturedPokemonUseCase;
    late MockIsFavoritePokemonUseCase mockIsFavoritePokemonUseCase;

    setUp(() {
      mockIsCapturedPokemonUseCase = MockIsCapturedPokemonUseCase();
      mockIsFavoritePokemonUseCase = MockIsFavoritePokemonUseCase();

      extendedPokemonRemoteMapper = ExtendedPokemonRemoteMapper(
        mockIsFavoritePokemonUseCase,
        mockIsCapturedPokemonUseCase,
      );
    });

    group('mapFromEntityToModel', () {
      test('should map $RemoteExtendedPokemon to $Pokemon', () {
        final entity = RemoteExtendedPokemon(
          1,
          'name',
          12,
          14,
          34,
          [],
          [],
          null,
          [],
          [],
        );
        const model = Pokemon(
          index: 1,
          name: 'name',
          baseExperience: 12,
          weight: 34,
          height: 14,
          imageUrl: '',
          abilities: [],
          moves: [],
          types: [],
          stats: [],
          isCaptured: false,
          isFavorite: true,
        );
        mockIsFavoritePokemonUseCase.mockCall(true);
        mockIsCapturedPokemonUseCase.mockCall(false);

        final result = extendedPokemonRemoteMapper.mapFromEntityToModel(entity);

        expect(result, model);
      });
    });

    group('mapFromModelToEntity', () {
      test('should throw $UnimplementedError', () {
        const model = Pokemon(
          index: 1,
          name: 'name',
          baseExperience: 12,
          weight: 34,
          height: 14,
          imageUrl: '',
          abilities: [],
          moves: [],
          types: [],
          stats: [],
          isCaptured: false,
          isFavorite: false,
        );

        expect(
          () => extendedPokemonRemoteMapper.mapFromModelToEntity(model),
          throwsA(isA<UnimplementedError>()),
        );
      });
    });
  });
}
