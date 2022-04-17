import 'package:flutter/material.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';
import 'package:provider/provider.dart';
import 'package:ui_core/ui_core.dart';

class ViewButtonWidget extends StatelessWidget {
  const ViewButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GuessPokemonViewModel>();
    var fabIcon = Icons.visibility_off;
    var elevation = 4.0;
    if (viewModel.isAnsweredCorrectly) {
      fabIcon = Icons.visibility;
      elevation = 0;
    }
    if (viewModel.isStateLoading) {
      fabIcon = Icons.do_disturb_alt_rounded;
      elevation = 0;
    }
    if (viewModel.isStateError) {
      fabIcon = Icons.broken_image;
      elevation = 0;
    }

    return SmallFABWidget(
      onPressed: viewModel.isStateSuccess ? viewModel.viewPokemon : null,
      iconData: fabIcon,
      toolTipLabel: 'View Pokemon',
      elevation: elevation,
    );
  }
}
