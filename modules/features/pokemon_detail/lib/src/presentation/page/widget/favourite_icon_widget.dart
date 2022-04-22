import 'package:flutter/material.dart';
import 'package:pokemon_detail/src/presentation/page/pokemon_detail_view_model.dart';
import 'package:provider/provider.dart';
import 'package:ui_core/ui_core.dart';

class FavouriteIconWidget extends StatelessWidget {
  const FavouriteIconWidget({required this.iconSize, Key? key})
      : super(key: key);

  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PokemonDetailViewModel>();
    final icon = viewModel.isFavorite ? Icons.favorite : Icons.favorite_border;
    return IconButton(
      iconSize: context.getGridDimen(iconSize),
      onPressed: viewModel.toggleFavoritePokemon,
      icon: Icon(icon, color: viewModel.pokemonTypeColor),
    );
  }
}
