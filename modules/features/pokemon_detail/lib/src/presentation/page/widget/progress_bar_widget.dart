import 'package:flutter/material.dart';
import 'package:pokemon_detail/src/presentation/page/pokemon_detail_view_model.dart';
import 'package:provider/provider.dart';
import 'package:ui_core/ui_core.dart';

class ProgressBarWidget extends StatelessWidget {
  const ProgressBarWidget({
    required this.progressInPercentage,
    Key? key,
  }) : super(key: key);

  final double progressInPercentage;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PokemonDetailViewModel>();

    return Container(
      clipBehavior: Clip.hardEdge,
      height: 3,
      alignment: Alignment.centerLeft,
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: context.colorPalette.grey10,
      ),
      child: FractionallySizedBox(
        widthFactor: progressInPercentage,
        child: Container(
          decoration: ShapeDecoration(
            shape: const StadiumBorder(),
            color: viewModel.pokemonTypeColor,
          ),
        ),
      ),
    );
  }
}
