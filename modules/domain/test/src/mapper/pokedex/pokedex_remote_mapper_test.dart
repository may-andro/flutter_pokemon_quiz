import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network/network.dart';

void main() {
  group(PokedexRemoteMapper, () {
    late PokemonStatsRemoteMapper pokemonStatsRemoteMapper;
    late PokemonRemoteMapper pokemonRemoteMapper;

    late PokedexRemoteMapper pokedexRemoteMapper;

    setUp(() {
      pokemonStatsRemoteMapper = PokemonStatsRemoteMapper();
      pokemonRemoteMapper = PokemonRemoteMapper(pokemonStatsRemoteMapper);

      pokedexRemoteMapper = PokedexRemoteMapper(pokemonRemoteMapper);
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
            ),
          ],
        );

        final result = pokedexRemoteMapper.mapFromEntityToModel(entity);

        expect(result, model);
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
