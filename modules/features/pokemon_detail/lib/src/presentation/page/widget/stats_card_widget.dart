import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:domain/domain.dart';
import 'package:ui_core/ui_core.dart';
import 'package:pokemon_detail/src/presentation/page/pokemon_detail_view_model.dart';
import 'package:pokemon_detail/src/presentation/page/widget/progress_bar_widget.dart';

class StatsCardWidget extends StatelessWidget {
  const StatsCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  Widget _buildList(BuildContext context) {
    final viewModel = context.watch<PokemonDetailViewModel>();
    final stats = viewModel.pokemonStats;
    return ListView.separated(
        key: const Key('pokemon_status_list'),
        separatorBuilder: (context, index) =>
            SizedBox(height: context.getGridDimen(3)),
        itemCount: stats.length,
        itemBuilder: (context, index) {
          return _buildStatItem(context, stats[index]);
        });
  }

  Widget _buildStatItem(BuildContext context, PokemonStat pokemonStat) {
    final viewModel = context.watch<PokemonDetailViewModel>();
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Text(
            pokemonStat.name,
            style: TextStyle(color: viewModel.pokemonTypeColor),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text('${pokemonStat.baseStat}'),
        ),
        Expanded(
          flex: 5,
          child: ProgressBarWidget(
            progressInPercentage: pokemonStat.baseStat / 100,
          ),
        ),
      ],
    );
  }
}
