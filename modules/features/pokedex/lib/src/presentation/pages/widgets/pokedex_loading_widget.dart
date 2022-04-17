import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class PokedexLoadingWidget extends StatelessWidget {
  const PokedexLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          'Loading Pokédex ...',
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorPalette.grey70,
          ),
        ),
        SizedBox(height: context.getGridDimen(5)),
        Expanded(
          child: AnimatedLoadingWidget(
            height: context.shortestSide * 0.3,
            width: context.shortestSide * 0.3,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
