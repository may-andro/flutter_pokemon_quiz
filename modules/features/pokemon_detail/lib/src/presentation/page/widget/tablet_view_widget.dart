import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_detail/src/presentation/page/pokemon_detail_view_model.dart';
import 'package:pokemon_detail/src/presentation/page/widget/stats_card_widget.dart';
import 'package:pokemon_detail/src/presentation/page/widget/favourite_icon_widget.dart';
import 'package:pokemon_detail/src/presentation/page/widget/pokemon_image_widget.dart';
import 'package:pokemon_detail/src/presentation/page/widget/pokemon_info_widget.dart';

class TabletViewWidget extends StatelessWidget {
  const TabletViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildImage(context)),
        Expanded(child: _buildOverView(context)),
      ],
    );
  }

  Widget _buildImage(BuildContext context) {
    return Column(
      children: [
        _buildToolbar(context),
        const Expanded(child: PokemonImageWidget()),
        _buildBottomNavigationBar(context),
      ],
    );
  }

  Widget _buildOverView(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _buildContent(context),
          ),
        ),
        SizedBox(height: context.getGridDimen(1)),
      ],
    );
  }

  Widget _buildToolbar(BuildContext context) {
    final viewModel = context.watch<PokemonDetailViewModel>();
    return Padding(
      padding: EdgeInsets.only(
        top: context.getGridDimen(1),
        left: context.getGridDimen(2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CloseIconButtonWidget(
            iconSizeFactor: 2.5,
            iconColor: viewModel.pokemonTypeColor,
          ),
          const FavouriteIconWidget(iconSize: 2.5),
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
      selectedItemColor: viewModel.pokemonTypeColor,
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
    return textStyle.copyWith(color: viewModel.pokemonTypeColor);
  }

  Widget _buildContent(BuildContext context) {
    final viewModel = context.watch<PokemonDetailViewModel>();
    switch (viewModel.selectedTabIndex) {
      case 0:
        return const PokemonInfoWidget();
      case 1:
        return Padding(
          padding: EdgeInsets.all(context.getGridDimen(3)),
          child: const StatsCardWidget(),
        );
      default:
        return const ErrorPageWidget();
    }
  }
}
