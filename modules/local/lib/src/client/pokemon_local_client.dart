import 'package:local/objectbox.g.dart';
import 'package:local/src/client/local_client.dart';
import 'package:local/src/entity/entities.dart';
import 'package:objectbox/objectbox.dart';
import 'package:collection/collection.dart';

class PokemonLocalClient extends LocalClient<LocalPokemon> {
  PokemonLocalClient(this._store) : _pokemonBox = _store.box<LocalPokemon>();
  final Store _store;
  late final Box<LocalPokemon> _pokemonBox;

  @override
  int put(LocalPokemon entity) {
    final pokemons = getAll();
    final pokemon =
        pokemons.firstWhereOrNull((pokemon) => entity.id == pokemon.id);
    if (pokemon == null) return _pokemonBox.put(entity, mode: PutMode.insert);
    return _pokemonBox.put(entity, mode: PutMode.update);
  }

  @override
  List<int> putMany(List<LocalPokemon> entities) =>
      _pokemonBox.putMany(entities);

  @override
  LocalPokemon? get(int id) => _pokemonBox.get(id);

  @override
  List<LocalPokemon> getMany(List<int> ids) =>
      _pokemonBox.getMany(ids).whereType<LocalPokemon>().toList();

  @override
  List<LocalPokemon> getAll() =>
      _pokemonBox.getAll().whereType<LocalPokemon>().toList();

  @override
  bool remove(int id) => _pokemonBox.remove(id);

  @override
  int removeMany(List<int> ids) => _pokemonBox.removeMany(ids);

  @override
  int removeAll() => _pokemonBox.removeAll();

  @override
  int count() => _pokemonBox.count();

  @override
  List<LocalPokemon> query(Condition<LocalPokemon> condition) {
    final query = (_pokemonBox.query(condition)).build();
    final results = query.find();
    query.close();
    return results;
  }

  @override
  void closeStore() {
    _store.close();
  }
}
