import 'package:flutter/material.dart';
import 'package:pokemon_detail/src/presentation/page/pokemon_detail_view_model.dart';
import 'package:ui_core/ui_core.dart';
import 'package:provider/provider.dart';

class PokemonTypeWidget extends StatelessWidget {
  const PokemonTypeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PokemonDetailViewModel>();
    return Wrap(
      spacing: context.getGridDimen(1),
      children: viewModel.pokemonTypeImages
          .map((assetPath) => _buildType(context, assetPath))
          .toList(),
    );
  }

  Widget _buildType(BuildContext context, String assetPath) {
    return CircleAvatar(
      radius: context.shortestSide * 0.05,
      child: Center(
        child: Image.asset(
          assetPath,
          package: 'ui_core',
        ),
      ),
    );
  }
}
