import 'package:data/src/data_source/data_source.dart';
import 'package:data/src/repository/pokemon/pokemon_repository.dart';
import 'package:local/local.dart';
import 'package:local/objectbox.g.dart';
import 'package:network/network.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl(this._pokemonDataSource);

  final PokemonDataSource _pokemonDataSource;

  @override
  void putPokemon(
    LocalPokemon localPokemon,
  ) {
    _pokemonDataSource.putPokemon(localPokemon);
  }

  @override
  void removePokemon(int id) {
    _pokemonDataSource.removePokemon(id);
  }

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
    return _pokemonDataSource.queryPokemon(
      LocalPokemon_.isFavorite.equals(true),
    );
  }

  @override
  List<LocalPokemon> queryCapturedPokemons() {
    return _pokemonDataSource.queryPokemon(
      LocalPokemon_.isCaptured.equals(true),
    );
  }

  @override
  LocalPokemon queryIsCapturedPokemon(int index) {
    return _pokemonDataSource
        .queryPokemon(
          LocalPokemon_.isCaptured
              .equals(true)
              .and(LocalPokemon_.index.equals(index)),
        )
        .first;
  }

  @override
  LocalPokemon queryIsFavoritePokemon(int index) {
    return _pokemonDataSource
        .queryPokemon(
          LocalPokemon_.isFavorite
              .equals(true)
              .and(LocalPokemon_.index.equals(index)),
        )
        .first;
  }
}
