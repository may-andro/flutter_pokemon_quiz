import 'package:flutter/material.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:ui_core/assets/fonts.gen.dart';
import 'package:ui_core/ui_core.dart';
import 'package:provider/provider.dart';

class SpeechTextWidget extends StatelessWidget {
  const SpeechTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GuessPokemonViewModel>();
    final highlightedStyle = context.textTheme.headline2!.copyWith(
      fontFamily: FontFamily.pokemon,
      letterSpacing: 12,
      package: 'ui_core',
      color: viewModel.pokemonTypeColor,
    );
    final highlightedWord = HighlightedWord(
      onTap: () {
        if (!viewModel.isPokemonDetailFeatureEnabled) return;
        _goToPokemonDetail(context);
      },
      textStyle: highlightedStyle,
    );

    final textStyle = context.textTheme.headline2!.copyWith(
      letterSpacing: 5,
      overflow: TextOverflow.ellipsis,
      fontFamily: FontFamily.pokemon,
      package: 'ui_core',
    );

    return Center(
      child: TextHighlight(
        text: viewModel.statusLabel,
        words: {
          viewModel.pokemonName: highlightedWord,
        },
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        textStyle: textStyle,
      ),
    );
  }

  void _goToPokemonDetail(BuildContext context) {
    final viewModel = context.read<GuessPokemonViewModel>();
    final pokemon = viewModel.pokemon;
    if (pokemon == null) return;
    Navigator.pushNamed(context, PokemonDetailRoute.root, arguments: pokemon);
  }
}
