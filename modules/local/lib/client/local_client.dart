import 'package:objectbox/objectbox.dart';

abstract class LocalClient<T> {
  void put(T entity);

  void putMany(List<T> entities);

  T? get(int id);

  List<T?> getMany(List<int> ids);

  List<T?> getAll();

  void remove(int id);

  void removeMany(List<int> ids);

  void removeAll();

  int count();

  List<T> query(Condition<T> condition);

  void closeStore();
}
