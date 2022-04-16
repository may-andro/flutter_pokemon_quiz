import 'package:flutter/material.dart';
import 'package:pokemon_quiz/feature/splash_page/splash_view_model.dart';
import 'package:ui_core/ui_core.dart';
import 'package:provider/provider.dart';

class PokedexButtonWidget extends StatelessWidget {
  const PokedexButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SplashViewModel>();

    if (!viewModel.isPokedexFeatureEnabled) {
      return const SizedBox.shrink();
    }
    return SmallFABWidget(
      backgroundColor: context.colorPalette.secondary,
      onPressed: () => Navigator.pushNamed(context, PokedexRoute.root),
      iconData: Icons.catching_pokemon,
    );
  }
}
