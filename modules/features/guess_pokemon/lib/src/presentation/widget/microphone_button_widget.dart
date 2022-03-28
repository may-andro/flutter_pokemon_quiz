import 'package:flutter/material.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';
import 'package:provider/provider.dart';
import 'package:ui_core/ui_core.dart';

class MicrophoneButtonWidget extends StatelessWidget {
  const MicrophoneButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GuessPokemonViewModel>();
    var fabIcon = viewModel.isListening ? Icons.mic : Icons.mic_none;
    if (viewModel.isAnsweredCorrectly) fabIcon = Icons.done;
    if (viewModel.isStateLoading) fabIcon = Icons.downloading;
    if (viewModel.isStateError) fabIcon = Icons.warning;

    final isClickable = fabIcon == Icons.mic || fabIcon == Icons.mic_none;

    return FloatingActionButton(
      backgroundColor:
          viewModel.isListening ? Colors.green : context.colorPalette.secondary,
      onPressed: isClickable ? viewModel.listenToSpeech : null,
      child: Icon(fabIcon),
    );
  }
}
