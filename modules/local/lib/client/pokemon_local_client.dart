import 'package:injectable/injectable.dart';
import 'package:local/client/local_client.dart';
import 'package:local/entity/entities.dart';
import 'package:local/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';

@LazySingleton(as: LocalClient)
class PokemonLocalClient extends LocalClient<LocalPokemon> {
  PokemonLocalClient(this._store) : _pokemonBox = _store.box<LocalPokemon>();
  final Store _store;
  late final Box<LocalPokemon> _pokemonBox;

  @override
  void put(LocalPokemon entity) => _pokemonBox.put(entity);

  @override
  void putMany(List<LocalPokemon> entities) => _pokemonBox.putMany(entities);

  @override
  LocalPokemon? get(int id) => _pokemonBox.get(id);

  @override
  List<LocalPokemon?> getMany(List<int> ids) => _pokemonBox.getMany(ids);

  @override
  List<LocalPokemon?> getAll() => _pokemonBox.getAll();

  @override
  void remove(int id) => _pokemonBox.remove(id);

  @override
  void removeMany(List<int> ids) => _pokemonBox.removeMany(ids);

  @override
  void removeAll() => _pokemonBox.removeAll();

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
