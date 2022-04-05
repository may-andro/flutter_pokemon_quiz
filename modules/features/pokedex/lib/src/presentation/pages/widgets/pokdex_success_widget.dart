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
      desktopBuilder: (context) => _buildGridView(context, 7),
    );
  }

  Widget _buildGridView(BuildContext context, int crossAxisCount) {
    final viewModel = context.read<PokedexViewModel>();
    final pokemons = viewModel.pokemonsMap.keys.toList();
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
      itemBuilder: (_, index) => _PokemonItem(
        pokemon: pokemons[index],
        isCaptured: viewModel.pokemonsMap[pokemons[index]] ?? false,
      ),
      cacheExtent: 9999,
    );
  }
}

class _PokemonItem extends StatelessWidget {
  const _PokemonItem({
    required this.pokemon,
    required this.isCaptured,
    Key? key,
  }) : super(key: key);
  final Pokemon pokemon;
  final bool isCaptured;

  @override
  Widget build(BuildContext context) {
    final color = isCaptured
        ? Colors.transparent
        : context.isDarkMode
            ? Colors.black87
            : Colors.black;
    final blendMode = isCaptured ? BlendMode.saturation : BlendMode.modulate;

    return SizedBox(
      height: context.getGridDimen(3),
      width: context.getGridDimen(3),
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(color, blendMode),
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
      ),
    );
  }
}
