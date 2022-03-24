import 'package:objectbox/objectbox.dart';

@Entity()
class LocalPokemon {
  LocalPokemon(
    this.id, {
    required this.index,
    required this.name,
    required this.imageUrl,
  });

  int? id;
  int index;
  String name;
  String imageUrl;
}
