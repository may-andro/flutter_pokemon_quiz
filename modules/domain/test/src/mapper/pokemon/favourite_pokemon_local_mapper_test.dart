import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local/local.dart';

void main() {
  group(FavouritePokemonLocalMapper, () {
    late FavouritePokemonLocalMapper favouritePokemonLocalMapper;

    setUp(() {
      favouritePokemonLocalMapper = FavouritePokemonLocalMapper();
    });

    group('mapFromEntityToModel', () {
      test('should map $LocalPokemon to $FavouritePokemon', () {
        final entity = LocalPokemon(
          index: 1,
          name: 'name',
          imageUrl: 'imageUrl',
        );
        const model = FavouritePokemon(
          index: 1,
          avatar: 'imageUrl',
          name: 'name',
        );

        final result = favouritePokemonLocalMapper.mapFromEntityToModel(entity);

        expect(result, model);
      });
    });

    group('mapFromModelToEntity', () {
      test('should throw $UnimplementedError', () {
        const model = FavouritePokemon(
          index: 1,
          avatar: 'imageUrl',
          name: 'name',
        );

        expect(
          () => favouritePokemonLocalMapper.mapFromModelToEntity(model),
          throwsA(isA<UnimplementedError>()),
        );
      });
    });
  });
}
