import 'package:flutter/material.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';
import 'package:provider/provider.dart';

class ViewButtonWidget extends StatelessWidget {
  const ViewButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GuessPokemonViewModel>();
    return FloatingActionButton(
      onPressed: viewModel.isStateSuccess ? viewModel.viewPokemon : null,
      child: const Icon(Icons.remove_red_eye_sharp),
      heroTag: null,
    );
  }
}
