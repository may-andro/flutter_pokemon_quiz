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
  List<LocalPokemon> getAll() {
    return _list;
  }

  @override
  List<LocalPokemon> getMany(List<int> ids) {
    return _list.where((element) => ids.contains(element.id)).toList();
  }

  @override
  int put(LocalPokemon entity) {
    _list.add(entity);
    return _list.indexOf(entity);
  }

  @override
  List<int> putMany(List<LocalPokemon> entities) {
    _list.addAll(entities);
    return entities.map((entity) => entity.id).toList();
  }

  @override
  List<LocalPokemon> query(Condition<LocalPokemon> condition) {
    return _list;
  }

  @override
  bool remove(int id) {
    _list.removeWhere((element) => element.id == id);
    return true;
  }

  @override
  int removeAll() {
    _list.clear();
    return 0;
  }

  @override
  int removeMany(List<int> ids) {
    _list.removeWhere((element) => ids.contains(element.id));
    return _list.length;
  }
}
