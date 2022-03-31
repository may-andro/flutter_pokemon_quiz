import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';
import 'package:guess_pokemon/src/presentation/page/widget/next_button_widget.dart';
import 'package:guess_pokemon/src/presentation/page/widget/pokedex_button_widget.dart';
import 'package:guess_pokemon/src/presentation/page/widget/microphone_button_widget.dart';
import 'package:guess_pokemon/src/presentation/page/widget/view_button_widget.dart';

class ButtonRowWidget extends StatelessWidget {
  const ButtonRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.getGridDimen(1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          ViewButtonWidget(),
          MicrophoneButtonWidget(),
          NextButtonWidget(),
          PokedexButtonWidget()
        ],
      ),
    );
  }
}
