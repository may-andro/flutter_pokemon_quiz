import 'package:flutter/material.dart';
import 'package:guess_pokemon/src/presentation/page/widget/next_button_widget.dart';
import 'package:ui_core/ui_core.dart';
import 'package:provider/provider.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';
import 'package:guess_pokemon/src/presentation/page/widget/widget.dart';

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
        Expanded(child: _buildQuestion(context)),
        const SpeechTextWidget(),
        SizedBox(height: context.getGridDimen(1)),
        _buildButtons(context),
        SizedBox(height: context.getGridDimen(3))
      ],
    );
  }

  Widget _buildTablet(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned(
                top: context.getGridDimen(3),
                left: 0,
                right: 0,
                child: QuestionTextWidget(
                  height: context.height * 0.2,
                  width: context.width * 0.8,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [const SpeechTextWidget(), _buildButtons(context)],
                ),
              ),
            ],
          ),
        ),
        Expanded(child: _buildQuestion(context)),
      ],
    );
  }

  Widget _buildQuestion(BuildContext context) {
    return Stack(
      children: [
        const QuestionBgImageWidget(),
        _buildPokemonImage(context),
      ],
    );
  }

  Widget _buildPokemonImage(BuildContext context) {
    final viewModel = context.watch<GuessPokemonViewModel>();

    return Positioned.fill(
      left: context.shortestSide * 0.2,
      right: context.shortestSide * 0.2,
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
        height: context.shortestSide * 0.2,
        width: context.shortestSide * 0.2,
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

  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.getGridDimen(3)),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: const [
          MicrophoneButtonWidget(),
          Align(
            alignment: Alignment.centerRight,
            child: NextButtonWidget(),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ViewButtonWidget(),
          ),
        ],
      ),
    );
  }
}
