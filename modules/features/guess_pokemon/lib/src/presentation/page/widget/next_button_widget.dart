import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';
import 'package:ui_core/ui_core.dart';

class NextButtonWidget extends StatelessWidget {
  const NextButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GuessPokemonViewModel>();
    return SmallFABWidget(
      onPressed: viewModel.isStateLoading ? null : viewModel.loadPokemon,
      iconData: Icons.next_plan,
      toolTipLabel: 'Show next Pokemon',
    );
  }
}
