import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_detail/src/presentation/page/widget/pokemon_type_widget.dart';
import 'package:ui_core/ui_core.dart';
import 'package:pokemon_detail/src/presentation/page/widget/pokemon_info_widget.dart';
import 'package:pokemon_detail/src/presentation/page/pokemon_detail_view_model.dart';

import '../../../mock/view_model/mocked_pokemon_detail_view_model.dart';
import '../../../test_utils/test_data.dart';
import '../../../test_utils/test_widget_wrapper.dart';

GetIt _locator = GetIt.instance;

void main() {
  group(PokemonInfoWidget, () {
    late MockedPokemonDetailViewModel mockedPokemonDetailViewModel;
    late Widget widget;

    setUp(() {
      uiCoreLocator = _locator;
      mockedPokemonDetailViewModel = MockedPokemonDetailViewModel();
      mockedPokemonDetailViewModel.mockPokemonIndex(testPokemon.index);
      mockedPokemonDetailViewModel.mockPokemonName(testPokemon.name);
      mockedPokemonDetailViewModel.mockPokemonTypeColor(Colors.red);
      mockedPokemonDetailViewModel.mockPokemonTypeImages(pokemonImageTypeList);

      _locator.registerFactory<PokemonDetailViewModel>(
        () => mockedPokemonDetailViewModel,
      );

      widget = TestWidgetWrapper(
          child: ViewModelProviderWidget<PokemonDetailViewModel>(
        builder: (context, _, __) => const PokemonInfoWidget(),
      ));
    });

    tearDown(() => _locator.reset());

    testWidgets('should show pokemon name', (tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.text(testPokemon.name), findsOneWidget);
    });

    testWidgets('should show pokemon index', (tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.text('${testPokemon.index}'), findsOneWidget);
    });

    testWidgets('should show $PokemonTypeWidget', (tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byType(PokemonTypeWidget), findsOneWidget);
    });
  });
}
