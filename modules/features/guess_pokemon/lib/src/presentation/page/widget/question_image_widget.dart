import 'package:flutter/material.dart';
import 'package:guess_pokemon/assets/assets.gen.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';
import 'package:ui_core/ui_core.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
        FittedBox(
          fit: BoxFit.fill,
          child: Image.asset(
            Assets.questionBg.path,
            fit: BoxFit.fill,
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

  Widget _buildPokemonImage(BuildContext context) {
    final color = isVisible
        ? Colors.transparent
        : context.isDarkMode
            ? Colors.black87
            : Colors.black;
    final blendMode = isVisible ? BlendMode.saturation : BlendMode.modulate;

    return ColorFiltered(
      colorFilter: ColorFilter.mode(color, blendMode),
      child: Hero(
        tag: url,
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.contain,
          progressIndicatorBuilder: (context, url, downloadProgress) {
            return Center(
              child: AnimatorLoadingWidget(
                height: context.shortestSide * 0.2,
                width: context.shortestSide * 0.2,
              ),
            );
          },
          errorWidget: (context, url, error) => Icon(
            Icons.error,
            size: context.getGridDimen(4),
          ),
        ),
      ),
    );
  }
}
