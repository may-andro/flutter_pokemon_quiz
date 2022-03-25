import 'package:objectbox/objectbox.dart';

@Entity()
class LocalPokemon {
  LocalPokemon({
    required this.index,
    required this.name,
    required this.imageUrl,
  });

  int id = 0;
  int index;
  String name;
  String imageUrl;
}
