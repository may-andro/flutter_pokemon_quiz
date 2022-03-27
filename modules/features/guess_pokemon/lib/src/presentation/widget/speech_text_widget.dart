import 'package:flutter/material.dart';
import 'package:guess_pokemon/assets/fonts.gen.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:ui_core/ui_core.dart';
import 'package:provider/provider.dart';

class SpeechTextWidget extends StatelessWidget {
  const SpeechTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GuessPokemonViewModel>();
    final highlightedStyle = context.textTheme.headlineLarge!.copyWith(
      fontFamily: FontFamily.pokemon,
      letterSpacing: 5,
      package: 'guess_pokemon',
      color: Colors.green,
    );
    final pokemonName = viewModel.pokemonName;

    return Center(
      child: TextHighlight(
        text: viewModel.text,
        words: {
          pokemonName: HighlightedWord(
            onTap: () => print(viewModel.pokemonName),
            textStyle: highlightedStyle,
          ),
          pokemonName.toUpperCase(): HighlightedWord(
            onTap: () => print(viewModel.pokemonName),
            textStyle: highlightedStyle,
          ),
          pokemonName.toLowerCase(): HighlightedWord(
            onTap: () => print(viewModel.pokemonName),
            textStyle: highlightedStyle,
          ),
          pokemonName.replaceFirst(
              pokemonName[0], pokemonName[0].toUpperCase()): HighlightedWord(
            onTap: () => print(viewModel.pokemonName),
            textStyle: highlightedStyle,
          ),
        },
        textAlign: TextAlign.center,
        textStyle: context.textTheme.headline2!.copyWith(
          letterSpacing: 5,
          fontFamily: FontFamily.pokemon,
          package: 'guess_pokemon',
        ),
      ),
    );
  }
}
