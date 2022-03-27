import 'package:flutter/material.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';
import 'package:guess_pokemon/src/presentation/widget/widget.dart';
import 'package:ui_core/ui_core.dart';
import 'package:provider/provider.dart';

class GuessPokemonPage extends StatelessWidget {
  const GuessPokemonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelProviderWidget<GuessPokemonViewModel>(
          onViewModelProvided: (viewModel) => viewModel.onInit(),
          builder: (context, viewModel, widget) {
            return ResponsiveContainerWidget(
              mobileBuilder: _buildMobile,
              tabletBuilder: _buildTablet,
              desktopBuilder: _buildTablet,
            );
          }),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: context.getGridDimen(3)),
        QuestionTextWidget(
          height: context.height * 0.1,
          width: context.width * 0.8,
        ),
        Expanded(
          child: Stack(
            children: [
              const QuestionBgImageWidget(),
              _buildPokemonImage(context),
            ],
          ),
        ),
        const SpeechTextWidget(),
        SizedBox(height: context.getGridDimen(1)),
        const ButtonRowWidget(),
        SizedBox(height: context.getGridDimen(1))
      ],
    );
  }

  Widget _buildPokemonImage(BuildContext context) {
    final viewModel = context.watch<GuessPokemonViewModel>();

    return Positioned.fill(
      left: context.width * 0.2,
      right: context.width * 0.2,
      child: ViewStateBuilderWidget(
        viewState: viewModel.viewState,
        loadingBuilder: _buildLoadingState,
        errorBuilder: _buildErrorState,
        builder: _buildSuccessState,
      ),
    );
  }

  Widget _buildSuccessState(BuildContext context) {
    final viewModel = context.watch<GuessPokemonViewModel>();
    return Center(
      child: QuestionImageWidget(
        url: viewModel.pokemonImage,
        isVisible: viewModel.isAnsweredCorrectly,
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return Center(
      child: AnimatorLoadingWidget(
        height: context.width * 0.2,
        width: context.width * 0.2,
      ),
    );
  }

  Widget _buildErrorState(BuildContext context) {
    return SizedBox(
      height: context.height * 0.25,
      child: Center(
        child: Icon(
          Icons.error,
          size: context.height * 0.25,
        ),
      ),
    );
  }

  Widget _buildTablet(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: QuestionTextWidget(
                  height: context.height * 0.5,
                  width: context.width * 0.8,
                ),
              ),
              const SpeechTextWidget(),
              const ButtonRowWidget(),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              const QuestionBgImageWidget(),
              _buildPokemonImage(context),
            ],
          ),
        ),
      ],
    );
  }
}
