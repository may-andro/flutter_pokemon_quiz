import 'package:flutter/material.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';
import 'package:provider/provider.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GuessPokemonViewModel>();
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          const Spacer(),
          FloatingActionButton(
            onPressed: viewModel.loadPokemon,
            child: const Icon(Icons.refresh_outlined),
          )
        ],
      ),
    );
  }
}
