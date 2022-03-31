import 'dart:ffi';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:ui_core/assets/fonts.gen.dart';
import 'package:ui_core/ui_core.dart';
import 'package:provider/provider.dart';

class SpeechTextWidget extends StatelessWidget {
  const SpeechTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GuessPokemonViewModel>();
    final highlightedStyle = context.textTheme.headline2!.copyWith(
      fontFamily: FontFamily.pokemon,
      letterSpacing: 12,
      package: 'ui_core',
      color: viewModel.typeColor,
    );
    final highlightedWord = HighlightedWord(
      onTap: () {
        if (!viewModel.isPokemonDetailFeatureEnabled) return;
        goToPokemonDetail(context, viewModel.pokemon);
      },
      textStyle: highlightedStyle,
    );

    final textStyle = context.textTheme.headline2!.copyWith(
      letterSpacing: 5,
      overflow: TextOverflow.ellipsis,
      fontFamily: FontFamily.pokemon,
      package: 'ui_core',
    );
    final pokemonName = viewModel.pokemonName;

    return SizedBox(
      height: context.shortestSide * 0.25,
      child: Center(
        child: TextHighlight(
          text: viewModel.text,
          words: {
            pokemonName: highlightedWord,
          },
          textAlign: TextAlign.center,
          textStyle: textStyle,
        ),
      ),
    );
  }

  void goToPokemonDetail(BuildContext context, Pokemon? pokemon) {
    if (pokemon == null) return;
    Navigator.pushNamed(context, PokemonDetailRoute.root, arguments: pokemon);
  }
}
