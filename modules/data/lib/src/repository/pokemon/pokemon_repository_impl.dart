import 'package:data/src/data_source/data_source.dart';
import 'package:data/src/repository/pokemon/pokemon_repository.dart';
import 'package:local/local.dart';
import 'package:local/objectbox.g.dart';
import 'package:network/network.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl(this._pokemonDataSource);

  final PokemonDataSource _pokemonDataSource;

  @override
  int putPokemon(LocalPokemon localPokemon) =>
      _pokemonDataSource.putPokemon(localPokemon);

  @override
  bool removePokemon(int id) => _pokemonDataSource.removePokemon(id);

  @override
  List<LocalPokemon> getPokemons() {
    return _pokemonDataSource.getPokemons().whereType<LocalPokemon>().toList();
  }

  @override
  Future<RemoteExtendedPokemon> fetchPokemon(int index) {
    return _pokemonDataSource.fetchPokemon(index);
  }

  @override
  List<LocalPokemon> queryFavoritePokemons() {
    return _queryPokemons(LocalPokemon_.isFavorite.equals(true));
  }

  @override
  List<LocalPokemon> queryCapturedPokemons() {
    return _queryPokemons(LocalPokemon_.isCaptured.equals(true));
  }

  @override
  bool queryIsCapturedPokemon(int index) {
    final pokemonList = _queryPokemons(LocalPokemon_.id.equals(index));
    if (pokemonList.isEmpty) return false;
    return pokemonList.first.isCaptured;
  }

  @override
  bool queryIsFavoritePokemon(int index) {
    final pokemonList = _queryPokemons(LocalPokemon_.id.equals(index));
    if (pokemonList.isEmpty) return false;
    return pokemonList.first.isFavorite;
  }

  List<LocalPokemon> _queryPokemons(Condition<LocalPokemon> condition) {
    return _pokemonDataSource.queryPokemon(condition);
  }

  @override
  LocalPokemon? getPokemon(int index) {
    final pokemonList = _queryPokemons(LocalPokemon_.id.equals(index));
    if (pokemonList.isEmpty) return null;

    return pokemonList.first;
  }
}
