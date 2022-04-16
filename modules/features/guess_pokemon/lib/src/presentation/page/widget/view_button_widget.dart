import 'package:flutter/material.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';
import 'package:provider/provider.dart';
import 'package:ui_core/ui_core.dart';

class ViewButtonWidget extends StatelessWidget {
  const ViewButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GuessPokemonViewModel>();
    return SmallFABWidget(
      onPressed: viewModel.isStateSuccess ? viewModel.viewPokemon : null,
      iconData: Icons.remove_red_eye_sharp,
      toolTipLabel: 'View Pokemon',
    );
  }
}
