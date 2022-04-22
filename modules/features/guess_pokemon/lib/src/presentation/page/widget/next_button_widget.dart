import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';
import 'package:ui_core/ui_core.dart';

class NextButtonWidget extends StatelessWidget {
  const NextButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GuessPokemonViewModel>();
    var elevation = 4.0;
    var fabIcon = Icons.navigate_next_rounded;
    if (viewModel.isStateLoading) {
      fabIcon = Icons.cloud_download_rounded;
      elevation = 0;
    }
    if (viewModel.isStateError) {
      fabIcon = Icons.replay_circle_filled;
      elevation = 0;
    }

    return SmallFABWidget(
      onPressed: viewModel.isStateLoading ? null : viewModel.loadPokemon,
      iconData: fabIcon,
      toolTipLabel: 'Show next Pokemon',
      elevation: elevation,
    );
  }
}
