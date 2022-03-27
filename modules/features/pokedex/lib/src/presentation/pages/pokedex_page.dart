import 'package:flutter/material.dart';
import 'package:pokedex/src/presentation/pages/pokedex_view_model.dart';
import 'package:pokedex/src/presentation/widgets/pokdex_success_widget.dart';
import 'package:pokedex/src/presentation/widgets/pokedex_error_widget.dart';
import 'package:pokedex/src/presentation/widgets/pokedex_loading_widget.dart';
import 'package:pokedex/src/presentation/widgets/pokedex_title_widget.dart';
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
            children: [
              _buildTopPokeball(context),
              _buildBottomPokeball(context),
              NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      backgroundColor: Colors.transparent,
                      title: const PokedexTitleWidget(),
                      floating: true,
                      forceElevated: innerBoxIsScrolled,
                    ),
                  ];
                },
                body: ViewStateBuilderWidget(
                  viewState: viewModel.viewState,
                  loadingBuilder: _buildLoadingState,
                  errorBuilder: _buildErrorState,
                  builder: _buildSuccessState,
                ),
              ),
              _buildFab(context),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTopPokeball(BuildContext context) {
    return Positioned(
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
      child: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.close),
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return const PokedexLoadingWidget();
  }

  Widget _buildErrorState(BuildContext context) {
    final viewModel = context.read<PokedexViewModel>();
    final errorCode = viewModel.errorCode;

    return const PokedexErrorWidget(error: 'Test');
  }

  Widget _buildSuccessState(BuildContext context) {
    return const PokedexSuccessWidget();
  }
}
