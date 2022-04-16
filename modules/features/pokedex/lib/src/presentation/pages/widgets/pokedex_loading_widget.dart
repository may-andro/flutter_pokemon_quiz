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
        const SizedBox(height: 24),
        Expanded(
          child: AnimatedLoadingWidget(
            height: context.height * 0.2,
            width: context.height * 0.2,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
