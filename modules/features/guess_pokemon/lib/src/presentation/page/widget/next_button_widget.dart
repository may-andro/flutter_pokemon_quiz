import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';

class NextButtonWidget extends StatelessWidget {
  const NextButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GuessPokemonViewModel>();
    return FloatingActionButton(
      onPressed: viewModel.isStateLoading ? null : viewModel.loadPokemon,
      child: const Icon(Icons.next_plan),
      heroTag: null,
    );
  }
}
