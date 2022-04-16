import 'package:flutter/material.dart';
import 'package:guess_pokemon/assets/assets.gen.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';
import 'package:ui_core/ui_core.dart';
import 'package:provider/provider.dart';

class QuestionImageWidget extends StatelessWidget {
  const QuestionImageWidget({
    required this.url,
    required this.isVisible,
    Key? key,
  }) : super(key: key);

  final String url;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GuessPokemonViewModel>();

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Positioned.fill(
          child: Image.asset(
            Assets.questionBg.path,
            fit: BoxFit.contain,
            color: context.isDarkMode
                ? context.colorPalette.grey70
                : context.colorPalette.grey30,
            package: 'guess_pokemon',
          ),
        ),
        FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: EdgeInsets.all(context.shortestSide * 0.2),
            child: ViewStateBuilderWidget(
              viewState: viewModel.viewState,
              loadingBuilder: _buildLoadingState,
              errorBuilder: _buildErrorState,
              builder: _buildPokemonImage,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return Center(
      child: AnimatedLoadingWidget(
        height: context.shortestSide * 0.2,
        width: context.shortestSide * 0.2,
      ),
    );
  }

  Widget _buildErrorState(BuildContext context) {
    return Center(
      child: ErrorIconWidget(
        height: context.shortestSide * 0.2,
        width: context.shortestSide * 0.2,
      ),
    );
  }

  Widget _buildPokemonImage(BuildContext context) {
    final color = isVisible
        ? Colors.transparent
        : context.isDarkMode
            ? Colors.black87
            : Colors.black;
    final blendMode = isVisible ? BlendMode.saturation : BlendMode.modulate;

    return Hero(
      tag: url,
      child: ColorFilteredImageWidget(
        imageUrl: url,
        boxFit: BoxFit.contain,
        filterColor: color,
        blendMode: blendMode,
      ),
    );
  }
}
