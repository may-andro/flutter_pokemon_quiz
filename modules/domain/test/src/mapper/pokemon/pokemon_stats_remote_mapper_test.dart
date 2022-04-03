import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network/network.dart';

void main() {
  group(PokemonStatsRemoteMapper, () {
    late PokemonStatsRemoteMapper pokemonStatsRemoteMapper;

    setUp(() {
      pokemonStatsRemoteMapper = PokemonStatsRemoteMapper();
    });

    group('mapFromEntityToModel', () {
      test('should map $RemoteStats to $PokemonStat', () {
        const model = PokemonStat(baseStat: 11, effort: 12, name: 'name');
        const entity = RemoteStats(11, 12, 'name', '');

        final result = pokemonStatsRemoteMapper.mapFromEntityToModel(entity);

        expect(result, model);
      });
    });

    group('mapFromModelToEntity', () {
      test('should map $PokemonStat to $RemoteStats', () {
        const pokemonStat = PokemonStat(baseStat: 1, effort: 1, name: 'name');

        expect(
          () => pokemonStatsRemoteMapper.mapFromModelToEntity(pokemonStat),
          throwsA(isA<UnimplementedError>()),
        );
      });
    });
  });
}
