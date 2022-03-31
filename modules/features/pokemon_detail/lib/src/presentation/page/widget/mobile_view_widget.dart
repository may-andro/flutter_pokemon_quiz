import 'package:flutter/material.dart';
import 'package:pokemon_detail/src/presentation/page/pokemon_detail_view_model.dart';
import 'package:pokemon_detail/src/presentation/page/widget/back_icon_widget.dart';
import 'package:pokemon_detail/src/presentation/page/widget/stats_card_widget.dart';
import 'package:ui_core/ui_core.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_detail/src/presentation/page/widget/favourite_icon_widget.dart';
import 'package:pokemon_detail/src/presentation/page/widget/pokemon_image_widget.dart';
import 'package:pokemon_detail/src/presentation/page/widget/pokemon_info_widget.dart';

class MobileViewWidget extends StatelessWidget {
  const MobileViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildToolbar(context),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _buildContent(context),
          ),
        ),
        SizedBox(height: context.getGridDimen(4)),
        _buildBottomNavigationBar(context),
        SizedBox(height: context.getGridDimen(3)),
      ],
    );
  }

  Widget _buildToolbar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.getGridDimen(2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          BackIconWidget(iconSize: 4),
          FavouriteIconWidget(iconSize: 4),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    final viewModel = context.watch<PokemonDetailViewModel>();
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      currentIndex: viewModel.selectedTabIndex,
      selectedItemColor: viewModel.background,
      onTap: viewModel.setSelectedTab,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          label: 'Overview',
          icon: Text(
            'Overview',
            style: _getBottomNavigationTextStyle(context, 0),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Stats',
          icon: Text(
            'Stats',
            style: _getBottomNavigationTextStyle(context, 1),
          ),
        ),
      ],
    );
  }

  TextStyle? _getBottomNavigationTextStyle(BuildContext context, int index) {
    final viewModel = context.watch<PokemonDetailViewModel>();
    final textStyle = viewModel.selectedTabIndex == index
        ? context.textTheme.titleLarge!
        : context.textTheme.titleMedium!;
    return textStyle.copyWith(color: viewModel.background);
  }

  Widget _buildContent(BuildContext context) {
    final viewModel = context.watch<PokemonDetailViewModel>();
    switch (viewModel.selectedTabIndex) {
      case 0:
        return Column(
          children: const [
            Expanded(child: PokemonImageWidget()),
            PokemonInfoWidget(),
          ],
        );
      case 1:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: context.getGridDimen(3)),
          child: const StatsCardWidget(),
        );
      case 2:
        return Container(color: Colors.black87);
      default:
        return Container(color: Colors.blue);
    }
  }
}
