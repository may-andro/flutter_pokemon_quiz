import 'package:flutter/material.dart';
import 'package:guess_pokemon/src/presentation/page/widget/desktop_view_widget.dart';
import 'package:guess_pokemon/src/presentation/page/widget/mobile_view_widget.dart';
import 'package:guess_pokemon/src/presentation/page/widget/tablet_view_widget.dart';
import 'package:ui_core/ui_core.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';

class GuessPokemonPage extends StatelessWidget {
  const GuessPokemonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelProviderWidget<GuessPokemonViewModel>(
          onViewModelProvided: (viewModel) async => await viewModel.onInit(),
          builder: (context, viewModel, widget) {
            return ResponsiveContainerWidget(
              mobileBuilder: (_) => const MobileViewWidget(),
              tabletBuilder: (_) => const TabletViewWidget(),
              desktopBuilder: (_) => const DesktopViewWidget(),
            );
          }),
    );
  }
}
