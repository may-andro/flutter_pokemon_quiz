import 'package:flutter/material.dart';
import 'package:ui_core/assets/assets.gen.dart';
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
          Image.asset(
            Assets.images.warning.path,
            height: context.height * 0.25,
            width: context.height * 0.25,
            package: 'ui_core',
          ),
          Text(
            error,
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorPalette.grey70,
            ),
          ),
        ],
      ),
    );
  }
}
