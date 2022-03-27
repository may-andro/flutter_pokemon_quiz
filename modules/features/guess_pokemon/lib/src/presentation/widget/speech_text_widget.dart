import 'package:avatar_glow/avatar_glow.dart';
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.getGridDimen(3)),
      child: Column(
        children: [
          _buildHint(context),
          _buildFab(context),
        ],
      ),
    );
  }

  Widget _buildHint(BuildContext context) {
    final viewModel = context.watch<GuessPokemonViewModel>();
    return SizedBox(
      height: context.height * 0.1,
      child: Center(
        child: TextHighlight(
          text: viewModel.text,
          words: {
            viewModel.pokemonName: HighlightedWord(
              onTap: () => print(viewModel.pokemonName),
              textStyle: context.textTheme.headlineLarge!.copyWith(
                fontFamily: FontFamily.pokemon,
                letterSpacing: 5,
                package: 'guess_pokemon',
                color: Colors.green,
              ),
            ),
          },
          textStyle: context.textTheme.headline2!.copyWith(
            letterSpacing: 5,
            fontFamily: FontFamily.pokemon,
            package: 'guess_pokemon',
          ),
        ),
      ),
    );
  }

  Widget _buildFab(BuildContext context) {
    final viewModel = context.watch<GuessPokemonViewModel>();
    var fabIcon = viewModel.isListening ? Icons.mic : Icons.mic_none;
    if (viewModel.isAnsweredCorrectly) fabIcon = Icons.done;
    if (viewModel.isStateLoading) fabIcon = Icons.downloading;
    if (viewModel.isStateError) fabIcon = Icons.warning;

    final isClickable = fabIcon == Icons.mic || fabIcon == Icons.mic_none;

    return AvatarGlow(
      animate: viewModel.isListening,
      glowColor: context.colorPalette.secondary,
      endRadius: context.getGridDimen(9),
      duration: const Duration(milliseconds: 2000),
      repeatPauseDuration: const Duration(milliseconds: 100),
      repeat: true,
      child: FloatingActionButton(
        onPressed: isClickable ? viewModel.listenToSpeech : null,
        child: Icon(fabIcon),
      ),
    );
  }
}
