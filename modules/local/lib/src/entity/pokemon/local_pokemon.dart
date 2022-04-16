import 'package:objectbox/objectbox.dart';

@Entity()
class LocalPokemon {
  LocalPokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isFavorite = false,
    this.isCaptured = false,
  });

  @Id(assignable: true)
  int id;
  String name;
  String imageUrl;
  bool isFavorite;
  bool isCaptured;
}
