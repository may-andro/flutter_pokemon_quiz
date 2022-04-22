import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import 'package:ui_core/ui_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pokemon_detail/src/presentation/page/pokemon_detail_view_model.dart';
import 'package:pokemon_detail/src/presentation/page/widget/mobile_view_widget.dart';
import 'package:pokemon_detail/src/presentation/page/widget/tablet_view_widget.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({required this.pokemon, Key? key}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelProviderWidget<PokemonDetailViewModel>(
          onViewModelProvided: (viewModel) => viewModel.onInit(pokemon),
          builder: (context, viewModel, widget) {
            if (viewModel.errorCode != null) {
              Fluttertoast.showToast(
                  msg: "This is error Toast",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }

            return ResponsiveContainerWidget(
              mobileBuilder: _buildMobile,
              tabletBuilder: _buildTablet,
              desktopBuilder: _buildDesktop,
            );
          }),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return const MobileViewWidget();
  }

  Widget _buildTablet(BuildContext context) {
    return const TabletViewWidget();
  }

  Widget _buildDesktop(BuildContext context) {
    return const TabletViewWidget();
  }
}
