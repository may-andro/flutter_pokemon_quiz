import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class PokedexTitleWidget extends StatelessWidget {
  const PokedexTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.getGridDimen(4)),
        Text(
          'Pokédex'.toUpperCase(),
          style: context.textTheme.labelLarge?.copyWith(
            color: context.colorPalette.grey70,
          ),
        ),
        SizedBox(height: context.getGridDimen(2)),
        Divider(height: 2, color: context.colorPalette.grey70),
        SizedBox(height: context.getGridDimen(2)),
      ],
    );
  }
}
