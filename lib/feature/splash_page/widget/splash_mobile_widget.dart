import 'package:flutter/material.dart';
import 'package:pokemon_quiz/feature/splash_page/widget/guess_pokemon_button_widget.dart';
import 'package:pokemon_quiz/feature/splash_page/widget/pokemon_logo_image_widget.dart';
import 'package:pokemon_quiz/feature/splash_page/widget/setting_button_widget.dart';
import 'package:pokemon_quiz/feature/splash_page/widget/splash_image_widget.dart';
import 'package:ui_core/ui_core.dart';

class SplashMobileWidget extends StatelessWidget {
  const SplashMobileWidget({
    required this.isInitialized,
    Key? key,
  }) : super(key: key);

  final bool isInitialized;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: context.getGridDimen(2)),
        const PokemonLogoImageWidget(),
        const Expanded(
          child: SplashImageWidget(),
        ),
        SizedBox(height: context.getGridDimen(3)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.getGridDimen(2)),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              GuessPokemonButtonWidget(isInitialized: isInitialized),
              Align(
                alignment: Alignment.centerRight,
                child: SettingButtonWidget(isInitialized: isInitialized),
              ),
            ],
          ),
        ),
        SizedBox(height: context.getGridDimen(3)),
      ],
    );
  }
}
