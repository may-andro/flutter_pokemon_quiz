import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_core/ui_core.dart';
import 'package:pokemon_detail/src/presentation/page/widget/pokemon_type_widget.dart';
import 'package:pokemon_detail/src/presentation/page/pokemon_detail_view_model.dart';

import '../../../mock/view_model/mocked_pokemon_detail_view_model.dart';
import '../../../test_utils/test_data.dart';
import '../../../test_utils/test_widget_wrapper.dart';

GetIt _locator = GetIt.instance;

void main() {
  group(PokemonTypeWidget, () {
    late MockedPokemonDetailViewModel mockedPokemonDetailViewModel;
    late Widget widget;

    setUp(() {
      uiCoreLocator = _locator;
      mockedPokemonDetailViewModel = MockedPokemonDetailViewModel();
      mockedPokemonDetailViewModel.mockPokemonTypeImages(pokemonImageTypeList);
      _locator.registerFactory<PokemonDetailViewModel>(
        () => mockedPokemonDetailViewModel,
      );

      widget = TestWidgetWrapper(
          child: ViewModelProviderWidget<PokemonDetailViewModel>(
        builder: (context, _, __) => const PokemonTypeWidget(),
      ));
    });

    tearDown(() => _locator.reset());

    testWidgets('should show type image list', (tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(
        find.byType(CircleAvatar),
        findsNWidgets(pokemonImageTypeList.length),
      );
    });
  });
}
