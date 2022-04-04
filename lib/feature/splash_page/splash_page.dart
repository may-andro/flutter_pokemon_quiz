import 'package:flutter/material.dart';
import 'package:pokemon_quiz/feature/splash_page/splash_view_model.dart';
import 'package:pokemon_quiz/feature/splash_page/widget/splash_desktop_widget.dart';
import 'package:pokemon_quiz/feature/splash_page/widget/splash_mobile_widget.dart';
import 'package:pokemon_quiz/feature/splash_page/widget/splash_tablet_widget.dart';
import 'package:ui_core/ui_core.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelProviderWidget<SplashViewModel>(
          builder: (context, viewModel, widget) {
        return ResponsiveContainerWidget(
          mobileBuilder: (_) => const SplashMobileWidget(),
          tabletBuilder: (_) => const SplashTabletWidget(),
          desktopBuilder: (_) => const SplashDesktopWidget(),
        );
      }),
    );
  }
}
