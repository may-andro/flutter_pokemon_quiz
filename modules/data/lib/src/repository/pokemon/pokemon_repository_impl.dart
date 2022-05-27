import 'package:data/src/data_source/data_source.dart';
import 'package:data/src/mapper/mapper.dart';
import 'package:local/local.dart';
import 'package:domain/domain.dart';
import 'package:local/objectbox.g.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl(
    this._pokemonDataSource,
    this._pokedexDataSource,
    this._pokemonRemoteMapper,
    this._extendedPokemonRemoteMapper,
  );

  final PokemonDataSource _pokemonDataSource;
  final PokedexDataSource _pokedexDataSource;
  final PokemonRemoteMapper _pokemonRemoteMapper;
  final ExtendedPokemonRemoteMapper _extendedPokemonRemoteMapper;

  @override
  int addToCaptured(Pokemon pokemon) {
    final localPokemon = LocalPokemon(
      id: pokemon.index,
      imageUrl: pokemon.imageUrl,
      name: pokemon.name,
      isCaptured: true,
      isFavorite: pokemon.isFavorite,
    );
    return _pokemonDataSource.putPokemon(localPokemon);
  }

  @override
  int addToFavorites(Pokemon pokemon) {
    final localPokemon = LocalPokemon(
      id: pokemon.index,
      imageUrl: pokemon.imageUrl,
      name: pokemon.name,
      isFavorite: true,
      isCaptured: pokemon.isCaptured,
    );
    return _pokemonDataSource.putPokemon(localPokemon);
  }

  @override
  Future<List<Pokemon>> fetchPokedex(String region) async {
    final remotePokedex = await _pokedexDataSource.fetchPokedex(region);

    final pokemons = remotePokedex.pokemons.map((item) {
      final pokemon = _pokemonRemoteMapper.mapFromEntityToModel(item);
      final isFavorite = isFavoritePokemon(pokemon.index);
      final isCaptured = isCapturedPokemon(pokemon.index);
      return pokemon.copyWith(isCaptured: isCaptured, isFavorite: isFavorite);
    }).toList();

    return Future.value(pokemons);
  }

  @override
  Future<Pokemon> fetchPokemon(int index) async {
    final remotePokemon = await _pokemonDataSource.fetchPokemon(index);
    final pokemon = _extendedPokemonRemoteMapper.mapFromEntityToModel(
      remotePokemon,
    );
    final isFavorite = isFavoritePokemon(pokemon.index);
    final isCaptured = isCapturedPokemon(pokemon.index);
    return Future.value(
      pokemon.copyWith(isCaptured: isCaptured, isFavorite: isFavorite),
    );
  }

  @override
  bool isCapturedPokemon(int index) {
    final pokemonList = _queryPokemons(LocalPokemon_.id.equals(index));
    if (pokemonList.isEmpty) return false;
    return pokemonList.first.isCaptured;
  }

  @override
  bool isFavoritePokemon(int index) {
    final pokemonList = _queryPokemons(LocalPokemon_.id.equals(index));
    if (pokemonList.isEmpty) return false;
    return pokemonList.first.isFavorite;
  }

  @override
  int removeFromFavorites(Pokemon pokemon) {
    final localPokemon = LocalPokemon(
      id: pokemon.index,
      imageUrl: pokemon.imageUrl,
      name: pokemon.name,
      isCaptured: pokemon.isCaptured,
    );
    return _pokemonDataSource.putPokemon(localPokemon);
  }

  List<LocalPokemon> _queryPokemons(Condition<LocalPokemon> condition) {
    return _pokemonDataSource.queryPokemon(condition);
  }
}
