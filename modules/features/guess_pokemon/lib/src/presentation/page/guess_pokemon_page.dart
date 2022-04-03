import 'package:flutter/material.dart';
import 'package:guess_pokemon/src/presentation/page/widget/desktop_view_widget.dart';
import 'package:guess_pokemon/src/presentation/page/widget/mobile_view_widget.dart';
import 'package:guess_pokemon/src/presentation/page/widget/tablet_view_widget.dart';
import 'package:ui_core/ui_core.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';

// ignore: prefer_const_constructors
class GuessPokemonPage extends StatelessWidget {
  const GuessPokemonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelProviderWidget<GuessPokemonViewModel>(
          onViewModelProvided: (viewModel) => viewModel.onInit(),
          builder: (context, viewModel, widget) {
            return ResponsiveContainerWidget(
              mobileBuilder: (_) => MobileViewWidget(),
              tabletBuilder: (_) => TabletViewWidget(),
              desktopBuilder: (_) => DesktopViewWidget(),
            );
          }),
    );
  }
}
