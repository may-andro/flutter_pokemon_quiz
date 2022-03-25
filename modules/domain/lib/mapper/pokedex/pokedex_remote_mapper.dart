import 'package:domain/mapper/model_entity_mapper.dart';
import 'package:domain/mapper/pokemon/pokemon_remote_mapper.dart';
import 'package:domain/model/pokedex/pokedex.dart';
import 'package:network/network.dart';
import 'package:injectable/injectable.dart';

@injectable
class PokedexRemoteMapper implements ModelEntityMapper<Pokedex, RemotePokedex> {
  PokedexRemoteMapper(this._pokemonRemoteMapper);

  final PokemonRemoteMapper _pokemonRemoteMapper;

  @override
  Pokedex mapFromEntityToModel(RemotePokedex entity) {
    final pokemons = entity.pokemons
        .map(
          _pokemonRemoteMapper.mapFromEntityToModel,
        )
        .toList();
    return Pokedex(pokemons: pokemons);
  }

  @override
  RemotePokedex mapFromModelToEntity(Pokedex model) {
    throw UnimplementedError();
  }
}
