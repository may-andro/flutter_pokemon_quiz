import 'package:flutter/material.dart';
import 'package:pokedex/src/presentation/pages/pokedex_view_model.dart';
import 'package:provider/provider.dart';
import 'package:ui_core/ui_core.dart';

class PokedexPage extends StatelessWidget {
  const PokedexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelProviderWidget<PokedexViewModel>(
        onViewModelProvided: (viewModel) => viewModel.onInit(),
        builder: (context, viewModel, widget) {
          return ViewStateBuilderWidget(
            viewState: viewModel.viewState,
            loadingBuilder: _buildLoadingState,
            errorBuilder: _buildErrorState,
            builder: _buildSuccessState,
          );
        },
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return Container();
  }

  Widget _buildErrorState(BuildContext context) {
    final viewModel = context.read<PokedexViewModel>();
    final errorCode = viewModel.errorCode;

    return Text('$errorCode');
  }

  Widget _buildSuccessState(BuildContext context) {
    final viewModel = context.read<PokedexViewModel>();
    final pokedex = viewModel.pokedex;

    return ListView(
      children: pokedex.pokemons
          .map(
            (e) => Card(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(e.name),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
