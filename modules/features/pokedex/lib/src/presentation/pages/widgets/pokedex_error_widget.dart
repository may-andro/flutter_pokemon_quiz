import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class PokedexErrorWidget extends StatelessWidget {
  const PokedexErrorWidget({
    required this.error,
    Key? key,
  }) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Error fetching Pokédex',
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorPalette.grey70,
            ),
          ),
          SizedBox(height: context.getGridDimen(4)),
          ErrorIconWidget(
            height: context.shortestSide * 0.3,
            width: context.shortestSide * 0.3,
          ),
          SizedBox(height: context.getGridDimen(4)),
          Text(
            error,
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorPalette.grey70,
            ),
          ),
        ],
      ),
    );
  }
}
