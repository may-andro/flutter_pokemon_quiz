import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_core/ui_core.dart';
import 'package:pokemon_detail/src/presentation/page/pokemon_detail_view_model.dart';

class BackIconWidget extends StatelessWidget {
  const BackIconWidget({
    required this.iconSize,
    Key? key,
  }) : super(key: key);

  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PokemonDetailViewModel>();
    return IconButton(
      iconSize: context.getGridDimen(iconSize),
      onPressed: () => Navigator.pop(context),
      icon: Icon(Icons.close, color: viewModel.background),
    );
  }
}
