import 'package:local/local.dart';
import 'package:objectbox/src/native/query/query.dart';

class FakePokemonLocalClient implements LocalClient<LocalPokemon> {
  final List<LocalPokemon> _list = [];

  @override
  void closeStore() {
    return;
  }

  @override
  int count() {
    return _list.length;
  }

  @override
  LocalPokemon? get(int id) {
    return _list.firstWhere((element) => element.id == id);
  }

  @override
  List<LocalPokemon?> getAll() {
    return _list;
  }

  @override
  List<LocalPokemon?> getMany(List<int> ids) {
    return _list.where((element) => ids.contains(element.index)).toList();
  }

  @override
  void put(LocalPokemon entity) {
    _list.add(entity);
  }

  @override
  void putMany(List<LocalPokemon> entities) {
    _list.addAll(entities);
  }

  @override
  List<LocalPokemon> query(Condition<LocalPokemon> condition) {
    throw UnimplementedError();
  }

  @override
  void remove(int id) {
    _list.removeWhere((element) => element.id == id);
  }

  @override
  void removeAll() {
    _list.clear();
  }

  @override
  void removeMany(List<int> ids) {
    _list.removeWhere((element) => ids.contains(element.id));
  }
}
