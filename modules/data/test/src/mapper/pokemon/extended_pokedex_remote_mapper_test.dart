import 'package:data/src/mapper/pokemon/extended_pokemon_remote_mapper.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network/network.dart';

void main() {
  group(ExtendedPokemonRemoteMapper, () {
    late ExtendedPokemonRemoteMapper extendedPokemonRemoteMapper;

    setUp(() {
      extendedPokemonRemoteMapper = ExtendedPokemonRemoteMapper();
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
          isFavorite: false,
        );
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
