import 'package:domain/src/model/pokemon/pokemon.dart';
import 'package:domain/src/repository/pokemon/pokemon_repository.dart';
import 'package:collection/collection.dart';

class FakePokemonRepository implements PokemonRepository {
  final _totalPokemons = [
    const Pokemon(
      index: 1,
      name: 'name1',
      baseExperience: 1,
      weight: 12,
      height: 22,
      imageUrl: 'imageUrl',
      abilities: [],
      moves: [],
      types: [],
      stats: [],
      isFavorite: false,
      isCaptured: false,
    ),
    const Pokemon(
      index: 2,
      name: 'name2',
      baseExperience: 1,
      weight: 12,
      height: 22,
      imageUrl: 'imageUrl',
      abilities: [],
      moves: [],
      types: [],
      stats: [],
      isFavorite: false,
      isCaptured: false,
    ),
    const Pokemon(
      index: 3,
      name: 'name3',
      baseExperience: 1,
      weight: 12,
      height: 22,
      imageUrl: 'imageUrl',
      abilities: [],
      moves: [],
      types: [],
      stats: [],
      isFavorite: false,
      isCaptured: false,
    ),
  ];

  @override
  int addToCaptured(Pokemon pokemon) {
    final searchedPokemon =
        _totalPokemons.firstWhereOrNull((element) => element == pokemon);

    if (searchedPokemon == null) throw Exception();

    final capturedPokemon = searchedPokemon.copyWith(isCaptured: true);
    _totalPokemons.remove(searchedPokemon);
    _totalPokemons.add(capturedPokemon);
    return _totalPokemons.indexOf(capturedPokemon);
  }

  @override
  int addToFavorites(Pokemon pokemon) {
    final searchedPokemon =
        _totalPokemons.firstWhereOrNull((element) => element == pokemon);

    if (searchedPokemon == null) throw Exception();

    final capturedPokemon = searchedPokemon.copyWith(isFavorite: true);
    _totalPokemons.remove(searchedPokemon);
    _totalPokemons.add(capturedPokemon);
    return _totalPokemons.indexOf(capturedPokemon);
  }

  @override
  Future<List<Pokemon>> fetchPokedex(String region) async {
    if (region == 'kanto' || region == 'jhoto') return _totalPokemons;
    throw Exception();
  }

  @override
  Future<Pokemon> fetchPokemon(int index) {
    final searchedPokemon =
        _totalPokemons.firstWhereOrNull((element) => element.index == index);

    if (searchedPokemon == null) throw Exception();

    return Future.value(searchedPokemon);
  }

  @override
  bool isCapturedPokemon(int index) {
    final searchedPokemon =
        _totalPokemons.firstWhereOrNull((element) => element.index == index);

    return searchedPokemon?.isCaptured ?? false;
  }

  @override
  bool isFavoritePokemon(int index) {
    final searchedPokemon =
        _totalPokemons.firstWhereOrNull((element) => element.index == index);

    return searchedPokemon?.isFavorite ?? false;
  }

  @override
  int removeFromFavorites(Pokemon pokemon) {
    final searchedPokemon =
        _totalPokemons.firstWhereOrNull((element) => element == pokemon);

    if (searchedPokemon == null) throw Exception();

    final favouritePokemon = searchedPokemon.copyWith(isFavorite: false);
    _totalPokemons.remove(searchedPokemon);
    _totalPokemons.add(favouritePokemon);
    return _totalPokemons.indexOf(favouritePokemon);
  }
}
