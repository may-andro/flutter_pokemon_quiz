import 'package:flutter/material.dart';
import 'package:guess_pokemon/assets/assets.gen.dart';

class QuestionTextWidget extends StatelessWidget {
  const QuestionTextWidget({
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        Assets.guessPokemon.path,
        width: width,
        height: height,
        fit: BoxFit.contain,
        package: 'guess_pokemon',
      ),
    );
  }
}
