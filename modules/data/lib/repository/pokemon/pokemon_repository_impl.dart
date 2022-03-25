import 'package:data/data_source/pokemon/pokemon_data_source.dart';
import 'package:data/repository/pokemon/pokemon_repository.dart';
import 'package:local/local.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PokemonRepository)
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
  List<LocalPokemon> getAllFavorites() {
    return _pokemonDataSource
        .getAllFavorites()
        .whereType<LocalPokemon>()
        .toList();
  }
}
