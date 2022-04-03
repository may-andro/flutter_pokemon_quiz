import 'package:data/src/data_source/data_source.dart';
import 'package:data/src/repository/pokemon/pokemon_repository.dart';
import 'package:local/local.dart';
import 'package:network/network.dart';


class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl(this._pokemonDataSource);

  final PokemonDataSource _pokemonDataSource;

  @override
  void putFavoritePokemon(
    LocalPokemon localPokemon,
  ) {
    _pokemonDataSource.putFavoritePokemon(localPokemon);
  }

  @override
  void removeFavoritePokemon(int id) {
    _pokemonDataSource.removeFavoritePokemon(id);
  }

  @override
  List<LocalPokemon> getAllFavoritePokemons() {
    return _pokemonDataSource
        .getAllFavoritePokemons()
        .whereType<LocalPokemon>()
        .toList();
  }

  @override
  Future<RemoteExtendedPokemon> fetchPokemon(int index) {
    return _pokemonDataSource.fetchPokemon(index);
  }
}
