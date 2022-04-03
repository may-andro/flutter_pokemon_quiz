import 'package:json_annotation/json_annotation.dart';
import 'package:network/src/entity/pokemon/remote_pokemon.dart';
import 'package:equatable/equatable.dart';

part 'remote_pokedex.g.dart';

@JsonSerializable()
class RemotePokedex extends Equatable {
  const RemotePokedex(this.pokemons);

  factory RemotePokedex.fromJson(Map<String, dynamic> json) =>
      _$RemotePokedexFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePokedexToJson(this);

  @JsonKey(name: 'pokemon')
  final List<RemotePokemon> pokemons;

  @override
  List<Object?> get props => [pokemons];
}
