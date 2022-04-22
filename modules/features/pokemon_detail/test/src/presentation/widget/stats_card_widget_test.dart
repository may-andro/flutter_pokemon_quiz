import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_detail/src/presentation/page/widget/stats_card_widget.dart';
import 'package:ui_core/ui_core.dart';
import 'package:pokemon_detail/src/presentation/page/pokemon_detail_view_model.dart';

import '../../../mock/view_model/mocked_pokemon_detail_view_model.dart';
import '../../../test_utils/test_data.dart';
import '../../../test_utils/test_widget_wrapper.dart';

GetIt _locator = GetIt.instance;

void main() {
  group(StatsCardWidget, () {
    late MockedPokemonDetailViewModel mockedPokemonDetailViewModel;
    late Widget widget;

    setUp(() {
      uiCoreLocator = _locator;
      mockedPokemonDetailViewModel = MockedPokemonDetailViewModel();
      mockedPokemonDetailViewModel.mockPokemonStats(testPokemon.stats);
      mockedPokemonDetailViewModel.mockPokemonTypeColor(Colors.red);

      _locator.registerFactory<PokemonDetailViewModel>(
        () => mockedPokemonDetailViewModel,
      );

      widget = TestWidgetWrapper(
          child: ViewModelProviderWidget<PokemonDetailViewModel>(
        builder: (context, _, __) => const StatsCardWidget(),
      ));
    });

    tearDown(() => _locator.reset());

    testWidgets('should show listview', (tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('pokemon_status_list')), findsOneWidget);
    });

    testWidgets('should show listview', (tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('pokemon_status_list')), findsOneWidget);
    });
  });
}
