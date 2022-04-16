import 'package:objectbox/objectbox.dart';

abstract class LocalClient<T> {
  int put(T entity);

  List<int> putMany(List<T> entities);

  T? get(int id);

  List<T> getMany(List<int> ids);

  List<T> getAll();

  bool remove(int id);

  int removeMany(List<int> ids);

  int removeAll();

  int count();

  List<T> query(Condition<T> condition);

  void closeStore();
}
