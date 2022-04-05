import 'package:objectbox/objectbox.dart';

@Entity()
class LocalPokemon {
  LocalPokemon({
    required this.index,
    required this.name,
    required this.imageUrl,
    this.isFavorite= false,
    this.isCaptured= false,
  });

  int id = 0;
  int index;
  String name;
  String imageUrl;
  bool isFavorite;
  bool isCaptured;
}
