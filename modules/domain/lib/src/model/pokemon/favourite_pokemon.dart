import 'package:equatable/equatable.dart';

class FavouritePokemon extends Equatable {
  const FavouritePokemon({
    required this.index,
    required this.avatar,
    required this.name,
  });

  final int index;
  final String avatar;
  final String name;

  @override
  List<Object?> get props => [index, avatar, name];
}
