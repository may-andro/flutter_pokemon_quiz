import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';
import 'package:provider/provider.dart';
import 'package:ui_core/assets/fonts.gen.dart';
import 'package:pokemon_detail/src/presentation/page/pokemon_detail_view_model.dart';
import 'package:pokemon_detail/src/presentation/page/widget/pokemon_type_widget.dart';

class PokemonInfoWidget extends StatelessWidget {
  const PokemonInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildIndexChip(context),
        SizedBox(height: context.getGridDimen(1)),
        _buildPokemonName(context),
        SizedBox(height: context.getGridDimen(1.5)),
        const PokemonTypeWidget(),
      ],
    );
  }

  Widget _buildPokemonName(BuildContext context) {
    final viewModel = context.watch<PokemonDetailViewModel>();
    return Text(
      viewModel.pokemonName,
      style: context.textTheme.headline1?.copyWith(
        color: viewModel.pokemonTypeColor,
        letterSpacing: 12,
        overflow: TextOverflow.ellipsis,
        fontFamily: FontFamily.pokemon,
        package: 'ui_core',
      ),
    );
  }

  Widget _buildIndexChip(BuildContext context) {
    final viewModel = context.watch<PokemonDetailViewModel>();
    return Chip(
      elevation: context.getGridDimen(1),
      padding: EdgeInsets.all(context.getGridDimen(1)),
      backgroundColor: viewModel.pokemonTypeColor,
      shadowColor: Colors.transparent,
      label: Text(
        '${viewModel.pokemonIndex}',
        style: context.textTheme.labelLarge?.copyWith(
          color: Colors.white,
        ),
      ), //Text
    );
  }
}
