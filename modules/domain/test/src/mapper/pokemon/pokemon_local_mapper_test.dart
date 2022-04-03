import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:local/local.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(PokemonLocalMapper, () {
    late PokemonLocalMapper pokemonLocalMapper;

    setUp(() {
      pokemonLocalMapper = PokemonLocalMapper();
    });

    group('mapFromEntityToModel', () {
      test('should throw $UnimplementedError', () {
        final entity = LocalPokemon(
          index: 1,
          name: 'name',
          imageUrl: 'imageUrl',
        );
        expect(
          () => pokemonLocalMapper.mapFromEntityToModel(entity),
          throwsA(isA<UnimplementedError>()),
        );
      });
    });

    group('mapFromModelToEntity', () {
      test('should map $Pokemon to $LocalPokemon', () {
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
        );

        final result = pokemonLocalMapper.mapFromModelToEntity(model);

        expect(result, isA<LocalPokemon>());
      });
    });
  });
}
