import 'package:domain/src/mapper/model_entity_mapper.dart';
import 'package:domain/src/mapper/pokemon/pokemon_remote_mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:network/network.dart';

class PokedexRemoteMapper implements ModelEntityMapper<Pokedex, RemotePokedex> {
  PokedexRemoteMapper(this._pokemonRemoteMapper);

  final PokemonRemoteMapper _pokemonRemoteMapper;

  @override
  Pokedex mapFromEntityToModel(RemotePokedex entity) {
    final pokemons =
        entity.pokemons.map(_pokemonRemoteMapper.mapFromEntityToModel).toList();
    return Pokedex(pokemons: pokemons);
  }

  @override
  RemotePokedex mapFromModelToEntity(Pokedex model) {
    throw UnimplementedError();
  }
}
