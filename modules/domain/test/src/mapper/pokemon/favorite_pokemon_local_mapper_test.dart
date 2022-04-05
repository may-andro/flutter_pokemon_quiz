import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local/local.dart';

void main() {
  group(CapturedPokemonLocalMapper, () {
    late CapturedPokemonLocalMapper favouritePokemonLocalMapper;

    setUp(() {
      favouritePokemonLocalMapper = CapturedPokemonLocalMapper();
    });

    group('mapFromEntityToModel', () {
      test('should map $LocalPokemon to $CapturedPokemon', () {
        final entity = LocalPokemon(
          index: 1,
          name: 'name',
          imageUrl: 'imageUrl',
        );
        const model = CapturedPokemon(
          index: 1,
          avatar: 'imageUrl',
          name: 'name',
          isCaptured: true,
        );

        final result = favouritePokemonLocalMapper.mapFromEntityToModel(entity);

        expect(result, model);
      });
    });

    group('mapFromModelToEntity', () {
      test('should throw $UnimplementedError', () {
        const model = CapturedPokemon(
          index: 1,
          avatar: 'imageUrl',
          name: 'name',
          isCaptured: true,
        );

        expect(
          () => favouritePokemonLocalMapper.mapFromModelToEntity(model),
          throwsA(isA<UnimplementedError>()),
        );
      });
    });
  });
}
