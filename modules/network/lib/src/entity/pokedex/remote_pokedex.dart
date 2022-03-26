import 'package:json_annotation/json_annotation.dart';
import 'package:network/src/entity/pokemon/remote_pokemon.dart';

part 'remote_pokedex.g.dart';

@JsonSerializable()
class RemotePokedex {
  RemotePokedex(this.pokemons);

  factory RemotePokedex.fromJson(Map<String, dynamic> json) =>
      _$RemotePokedexFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePokedexToJson(this);

  @JsonKey(name: 'pokemon')
  final List<RemotePokemon> pokemons;
}
