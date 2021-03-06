import 'package:data/src/mapper/pokemon/pokemon_remote_mapper.dart';
import 'package:data/src/mapper/pokemon/pokemon_stats_remote_mapper.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network/network.dart';

void main() {
  group(PokemonRemoteMapper, () {
    late PokemonStatsRemoteMapper pokemonStatsRemoteMapper;

    late PokemonRemoteMapper pokemonRemoteMapper;

    setUp(() {
      pokemonStatsRemoteMapper = PokemonStatsRemoteMapper();
      pokemonRemoteMapper = PokemonRemoteMapper(pokemonStatsRemoteMapper);
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
          isFavorite: false,
        );

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
