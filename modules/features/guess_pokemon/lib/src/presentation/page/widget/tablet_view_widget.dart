import 'package:flutter/material.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';
import 'package:guess_pokemon/src/presentation/page/widget/microphone_button_widget.dart';
import 'package:guess_pokemon/src/presentation/page/widget/next_button_widget.dart';
import 'package:guess_pokemon/src/presentation/page/widget/question_image_widget.dart';
import 'package:guess_pokemon/src/presentation/page/widget/question_text_widget.dart';
import 'package:guess_pokemon/src/presentation/page/widget/speech_text_widget.dart';
import 'package:guess_pokemon/src/presentation/page/widget/view_button_widget.dart';
import 'package:provider/provider.dart';
import 'package:ui_core/ui_core.dart';

class TabletViewWidget extends StatelessWidget {
  const TabletViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GuessPokemonViewModel>();

    return Stack(
      alignment: AlignmentDirectional.center,
      fit: StackFit.expand,
      children: [
        Positioned(
          top: context.height * 0.05,
          left: 0,
          right: 0,
          child: QuestionTextWidget(
            height: context.height * 0.1,
            width: context.width * 0.8,
          ),
        ),
        Positioned(
          top: context.height * 0.2,
          bottom: context.height * 0.3,
          right: 0,
          left: 0,
          child: QuestionImageWidget(
            url: viewModel.pokemonImage,
            isVisible: viewModel.isAnsweredCorrectly,
          ),
        ),
        Positioned(
          bottom: context.height * 0.2,
          left: context.width * 0.05,
          right: context.width * 0.05,
          height: context.height * 0.1,
          child: const SpeechTextWidget(),
        ),
        Positioned(
          bottom: context.height * 0.05,
          left: context.width * 0.2,
          right: context.width * 0.2,
          child: _buildButtons(context),
        ),
      ],
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
