import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/src/presentation/pages/pokedex_view_model.dart';
import 'package:provider/provider.dart';
import 'package:ui_core/ui_core.dart';

class PokedexSuccessWidget extends StatelessWidget {
  const PokedexSuccessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainerWidget(
      mobileBuilder: (context) => _buildGridView(context, 3, 'mobile_view'),
      tabletBuilder: (context) => _buildGridView(context, 5, 'tablet_view'),
      desktopBuilder: (context) => _buildGridView(context, 7, 'desktop_view'),
    );
  }

  Widget _buildGridView(
    BuildContext context,
    int crossAxisCount,
    String key,
  ) {
    final viewModel = context.read<PokedexViewModel>();
    final pokemons = viewModel.pokedex.pokemons;
    return GridView.builder(
      key: Key(key),
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
      ),
      cacheExtent: 9999,
    );
  }
}

class _PokemonItem extends StatelessWidget {
  const _PokemonItem({
    required this.pokemon,
    Key? key,
  }) : super(key: key);
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final color = pokemon.isCaptured
        ? Colors.transparent
        : context.isDarkMode
            ? Colors.black87
            : Colors.black;
    final blendMode =
        pokemon.isCaptured ? BlendMode.saturation : BlendMode.modulate;

    return Hero(
      tag: pokemon.imageUrl,
      child: SizedBox(
        height: context.getGridDimen(3),
        width: context.getGridDimen(3),
        child: InkWell(
          onTap: pokemon.isCaptured
              ? () => _goToPokemonDetail(context, pokemon)
              : null,
          child: Stack(
            children: [
              ColorFilteredImageWidget(
                filterColor: color,
                blendMode: blendMode,
                imageUrl: pokemon.imageUrl,
                sizeFactor: 0.1,
              ),
              if (pokemon.isFavorite)
                Positioned(
                  top: context.getGridDimen(0.4),
                  right: context.getGridDimen(0.4),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                )
              else
                const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  void _goToPokemonDetail(BuildContext context, Pokemon pokemon) {
    Navigator.pushNamed(context, PokemonDetailRoute.root, arguments: pokemon);
  }
}
