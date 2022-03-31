import 'package:flutter/material.dart';
import 'package:pokemon_detail/src/presentation/page/pokemon_detail_view_model.dart';
import 'package:ui_core/ui_core.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
      child: CachedNetworkImage(
        imageUrl: viewModel.pokemonImage,
        fit: BoxFit.contain,
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return Center(
            child: AnimatorLoadingWidget(
              height: context.shortestSide * 0.25,
              width: context.shortestSide * 0.25,
            ),
          );
        },
        errorWidget: (context, url, error) => Icon(
          Icons.error,
          size: context.getGridDimen(4),
        ),
      ),
    );
  }
}
