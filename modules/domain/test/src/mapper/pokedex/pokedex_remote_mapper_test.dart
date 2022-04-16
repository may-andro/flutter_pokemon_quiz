import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

import '../../mock/mapper/pokemon/mock_pokemon_remote_mapper.dart';

void main() {
  group(PokedexRemoteMapper, () {
    setUpAll(() {
      registerFallbackValue(const RemotePokemon(
        index: 1,
        name: 'name',
        baseExperience: 2,
        weight: 3,
        height: 4,
        imageUrl: 'imageUrl',
        abilities: [],
        moves: [],
        types: [],
        stats: [],
      ));
    });

    late MockPokemonRemoteMapper mockPokemonRemoteMapper;

    late PokedexRemoteMapper pokedexRemoteMapper;

    setUp(() {
      mockPokemonRemoteMapper = MockPokemonRemoteMapper();

      pokedexRemoteMapper = PokedexRemoteMapper(mockPokemonRemoteMapper);
    });

    group('mapFromEntityToModel', () {
      test('should map $RemotePokedex to $Pokedex', () {
        const entity = RemotePokedex([
          RemotePokemon(
            index: 1,
            name: 'name',
            baseExperience: 2,
            weight: 3,
            height: 4,
            imageUrl: 'imageUrl',
            abilities: [],
            moves: [],
            types: [],
            stats: [],
          ),
        ]);
        const pokemonModel = Pokemon(
          index: 1,
          name: 'name',
          baseExperience: 2,
          weight: 3,
          height: 4,
          imageUrl: 'imageUrl',
          abilities: [],
          moves: [],
          types: [],
          stats: [],
          isFavorite: false,
          isCaptured: false,
        );
        const pokedexModel = Pokedex(
          pokemons: [
            pokemonModel,
          ],
        );
        mockPokemonRemoteMapper.mockMapFromEntityToModel(pokemonModel);

        final result = pokedexRemoteMapper.mapFromEntityToModel(entity);

        expect(result, pokedexModel);
      });
    });

    group('mapFromModelToEntity', () {
      test('should throw $UnimplementedError', () {
        const model = Pokedex(
          pokemons: [
            Pokemon(
              index: 1,
              name: 'name',
              baseExperience: 2,
              weight: 3,
              height: 4,
              imageUrl: 'imageUrl',
              abilities: [],
              moves: [],
              types: [],
              stats: [],
              isFavorite: false,
              isCaptured: false,
            ),
          ],
        );

        expect(
          () => pokedexRemoteMapper.mapFromModelToEntity(model),
          throwsA(isA<UnimplementedError>()),
        );
      });
    });
  });
}
