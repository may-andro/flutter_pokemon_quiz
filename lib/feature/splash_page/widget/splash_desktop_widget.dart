import 'package:flutter/material.dart';
import 'package:pokemon_quiz/feature/splash_page/widget/guess_pokemon_button_widget.dart';
import 'package:pokemon_quiz/feature/splash_page/widget/pokedex_button_widget.dart';
import 'package:pokemon_quiz/feature/splash_page/widget/pokemon_logo_image_widget.dart';
import 'package:pokemon_quiz/feature/splash_page/widget/setting_button_widget.dart';
import 'package:pokemon_quiz/feature/splash_page/widget/splash_image_widget.dart';
import 'package:ui_core/ui_core.dart';

class SplashDesktopWidget extends StatelessWidget {
  const SplashDesktopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      fit: StackFit.expand,
      children: [
        Positioned(
          top: 0,
          left: 0,
          bottom: 0,
          right: context.width * 0.5,
          child: const PokemonLogoImageWidget(),
        ),
        Positioned(
          top: 0,
          right: 0,
          left: context.width * 0.4,
          bottom: 0,
          child: const SplashImageWidget(),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: context.width * 0.5,
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
          GuessPokemonButtonWidget(),
          Align(
            alignment: Alignment.centerRight,
            child: SettingButtonWidget(),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: PokedexButtonWidget(),
          ),
        ],
      ),
    );
  }
}
