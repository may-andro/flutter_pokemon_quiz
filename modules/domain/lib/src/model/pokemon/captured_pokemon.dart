import 'package:equatable/equatable.dart';

class CapturedPokemon extends Equatable {
  const CapturedPokemon({
    required this.index,
    required this.avatar,
    required this.name,
    required this.isCaptured,
  });

  final int index;
  final String avatar;
  final String name;
  final bool isCaptured;

  @override
  List<Object?> get props => [index, avatar, name, isCaptured];
}
