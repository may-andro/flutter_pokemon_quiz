import 'package:flutter/material.dart';
import 'package:guess_pokemon/assets/assets.gen.dart';
import 'package:ui_core/ui_core.dart';

class QuestionBgImageWidget extends StatelessWidget {
  const QuestionBgImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        Assets.questionBg.path,
        fit: BoxFit.contain,
        color: context.isDarkMode
            ? context.colorPalette.grey70
            : context.colorPalette.grey30,
        package: 'guess_pokemon',
      ),
    );
  }
}
