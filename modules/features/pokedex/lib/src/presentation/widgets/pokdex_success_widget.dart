import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/src/presentation/pages/pokedex_view_model.dart';
import 'package:provider/provider.dart';
import 'package:ui_core/ui_core.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PokedexSuccessWidget extends StatelessWidget {
  const PokedexSuccessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainerWidget(
      mobileBuilder: (context) => _buildGridView(context, 3),
      tabletBuilder: (context) => _buildGridView(context, 5),
      desktopBuilder: (context) => _buildGridView(context, 10),
    );
  }

  Widget _buildGridView(BuildContext context, int crossAxisCount) {
    final viewModel = context.read<PokedexViewModel>();
    final pokemons = viewModel.pokedex.pokemons;
    return GridView.builder(
      padding: EdgeInsets.only(
        bottom: context.getGridDimen(10),
        left: context.getGridDimen(2),
        right: context.getGridDimen(2),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: context.getGridDimen(2),
        mainAxisSpacing: context.getGridDimen(2),
      ),
      itemCount: pokemons.length,
      itemBuilder: (_, index) => _PokemonItem(pokemon: pokemons[index]),
      cacheExtent: 9999,
    );
  }
}

class _PokemonItem extends StatelessWidget {
  const _PokemonItem({required this.pokemon, Key? key}) : super(key: key);
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.getGridDimen(3),
      width: context.getGridDimen(3),
      child: CachedNetworkImage(
        imageUrl: pokemon.imageUrl,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return Center(
            child: PokeballImageWidget(
              height: context.getGridDimen(4),
              width: context.getGridDimen(4),
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
