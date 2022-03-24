import 'package:objectbox/objectbox.dart';

abstract class LocalClient<T> {
  void put(T entity);

  void putMany(List<T> entities);

  void get(int id);

  void getMany(List<int> ids);

  void getAll();

  void remove(int id);

  void removeMany(List<int> ids);

  void removeAll();

  int count();

  List<T> query(Condition<T> condition);

  void closeStore();
}
