import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_core/ui_core.dart';
import 'package:pokemon_detail/src/presentation/page/widget/progress_bar_widget.dart';
import 'package:pokemon_detail/src/presentation/page/pokemon_detail_view_model.dart';

import '../../../mock/view_model/mocked_pokemon_detail_view_model.dart';
import '../../../test_utils/test_widget_wrapper.dart';

GetIt _locator = GetIt.instance;
const _progressInPercentage = 15.0;

void main() {
  group(ProgressBarWidget, () {
    late MockedPokemonDetailViewModel mockedPokemonDetailViewModel;
    late Widget widget;

    setUp(() {
      uiCoreLocator = _locator;
      mockedPokemonDetailViewModel = MockedPokemonDetailViewModel();
      mockedPokemonDetailViewModel.mockPokemonTypeColor(Colors.red);

      _locator.registerFactory<PokemonDetailViewModel>(
        () => mockedPokemonDetailViewModel,
      );

      widget = TestWidgetWrapper(
          child: ViewModelProviderWidget<PokemonDetailViewModel>(
        builder: (context, _, __) => const ProgressBarWidget(
          progressInPercentage: _progressInPercentage,
        ),
      ));
    });

    tearDown(() => _locator.reset());

    testWidgets(
        'should show progress size box with width factor $_progressInPercentage',
        (tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      final sizeBoxProgress = tester.firstWidget(
        find.byType(FractionallySizedBox),
      ) as FractionallySizedBox;

      expect(sizeBoxProgress.widthFactor, _progressInPercentage);
    });
  });
}
