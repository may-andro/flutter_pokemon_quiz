import 'package:flutter/material.dart';
import 'package:pokemon_detail/src/presentation/page/pokemon_detail_view_model.dart';
import 'package:ui_core/ui_core.dart';
import 'package:provider/provider.dart';

class PokemonImageWidget extends StatelessWidget {
  const PokemonImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PokemonDetailViewModel>();
    return Hero(
      tag: viewModel.pokemonImage,
      child: ColorFilteredImageWidget(
        imageUrl: viewModel.pokemonImage,
        boxFit: BoxFit.contain,
        sizeFactor: 0.25,
      ),
    );
  }
}
