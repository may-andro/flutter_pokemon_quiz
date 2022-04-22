import 'package:flutter/material.dart';
import 'package:pokedex/src/presentation/pages/pokedex_view_model.dart';
import 'package:pokedex/src/presentation/pages/widgets/pokdex_success_widget.dart';
import 'package:pokedex/src/presentation/pages/widgets/pokedex_error_widget.dart';
import 'package:pokedex/src/presentation/pages/widgets/pokedex_loading_widget.dart';
import 'package:pokedex/src/presentation/pages/widgets/pokedex_title_widget.dart';
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
          return Stack(
            fit: StackFit.expand,
            children: [
              _buildTopPokeball(context),
              _buildBottomPokeball(context),
              _buildPokedex(context),
              _buildFab(context),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPokedex(BuildContext context) {
    final viewModel = context.read<PokedexViewModel>();

    return Column(
      children: [
        const PokedexTitleWidget(),
        Expanded(
          child: ViewStateBuilderWidget(
            viewState: viewModel.viewState,
            loadingBuilder: _buildLoadingState,
            errorBuilder: _buildErrorState,
            builder: _buildSuccessState,
          ),
        ),
      ],
    );
  }

  Widget _buildTopPokeball(BuildContext context) {
    return Positioned(
      key: const Key('top_pokeball'),
      right: -context.height * 0.2,
      top: -context.height * 0.15,
      child: PokeballImageWidget(
        height: context.height * 0.4,
        width: context.height * 0.4,
      ),
    );
  }

  Widget _buildBottomPokeball(BuildContext context) {
    return Positioned(
      key: const Key('bottom_pokeball'),
      left: -context.height * 0.3,
      bottom: -context.height * 0.35,
      child: PokeballImageWidget(
        height: context.height * 0.8,
        width: context.height * 0.8,
      ),
    );
  }

  Widget _buildFab(BuildContext context) {
    return Positioned(
      bottom: context.getGridDimen(2),
      right: 0,
      left: 0,
      child: SmallFABWidget(
        onPressed: () => Navigator.pop(context),
        iconData: Icons.close,
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return const PokedexLoadingWidget();
  }

  Widget _buildErrorState(BuildContext context) {
    final viewModel = context.read<PokedexViewModel>();
    final errorCode = viewModel.errorCode;

    return PokedexErrorWidget(error: 'Test $errorCode');
  }

  Widget _buildSuccessState(BuildContext context) {
    return const PokedexSuccessWidget();
  }
}
