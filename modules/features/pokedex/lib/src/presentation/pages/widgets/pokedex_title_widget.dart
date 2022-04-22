import 'package:flutter/material.dart';
import 'package:pokedex/assets/assets.gen.dart';
import 'package:ui_core/ui_core.dart';

class PokedexTitleWidget extends StatelessWidget {
  const PokedexTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.getGridDimen(2)),
        Center(
          child: Image.asset(
            Assets.images.pokedex.path,
            width: context.shortestSide * 0.7,
            height: context.shortestSide * 0.1,
            fit: BoxFit.contain,
            package: 'pokedex',
          ),
        ),
        SizedBox(height: context.getGridDimen(2)),
        Divider(
          height: 2,
          color: context.colorPalette.grey70,
        ),
      ],
    );
  }
}
