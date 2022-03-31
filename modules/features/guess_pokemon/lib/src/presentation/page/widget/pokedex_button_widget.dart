import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';
import 'package:provider/provider.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';

class PokedexButtonWidget extends StatelessWidget {
  const PokedexButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GuessPokemonViewModel>();

    if (!viewModel.isPokedexFeatureEnabled) {
      return const SizedBox.shrink();
    }

    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, PokedexRoute.root);
      },
      child: const Icon(Icons.catching_pokemon),
    );
  }
}
