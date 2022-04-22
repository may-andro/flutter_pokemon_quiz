import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_detail/src/presentation/page/pokemon_detail_page.dart';
import 'package:pokemon_detail/src/presentation/page/pokemon_detail_view_model.dart';
import 'package:pokemon_detail/src/presentation/page/widget/mobile_view_widget.dart';
import 'package:pokemon_detail/src/presentation/page/widget/tablet_view_widget.dart';
import 'package:ui_core/ui_core.dart';
import 'package:get_it/get_it.dart';

import '../../mock/view_model/mocked_pokemon_detail_view_model.dart';
import '../../test_utils/test_data.dart';
import '../../test_utils/test_device_size.dart';
import '../../test_utils/test_widget_wrapper.dart';

GetIt _locator = GetIt.instance;

void main() {
  group(PokemonDetailPage, () {
    late MockedPokemonDetailViewModel mockedPokemonDetailViewModel;
    late Widget widget;

    setUp(() {
      uiCoreLocator = _locator;
      mockedPokemonDetailViewModel = MockedPokemonDetailViewModel();

      mockedPokemonDetailViewModel.onInit(testPokemon);
      mockedPokemonDetailViewModel.mockPokemonImage(testPokemon.imageUrl);
      mockedPokemonDetailViewModel.mockPokemonIndex(testPokemon.index);
      mockedPokemonDetailViewModel.mockPokemonName(testPokemon.name);
      mockedPokemonDetailViewModel.mockPokemonStats(testPokemon.stats);
      mockedPokemonDetailViewModel.mockPokemonTypeImages([]);
      mockedPokemonDetailViewModel.mockViewState(ViewState.loading);
      mockedPokemonDetailViewModel.mockPokemonTypeColor(Colors.red);
      mockedPokemonDetailViewModel.mockIsFavorite(false);
      mockedPokemonDetailViewModel.mockSelectedTabIndex(1);

      _locator.registerFactory<PokemonDetailViewModel>(
        () => mockedPokemonDetailViewModel,
      );

      widget = const TestWidgetWrapper(
        child: PokemonDetailPage(pokemon: testPokemon),
      );
    });

    tearDown(() => _locator.reset());

    testWidgets('should load $MobileViewWidget when the view port is mobile',
        (tester) async {
      tester.binding.window.physicalSizeTestValue = maxPhoneSize;
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(MobileViewWidget), findsOneWidget);
      expect(find.byType(TabletViewWidget), findsNothing);
    });

    testWidgets('should load $TabletViewWidget when the view port is tablet',
        (tester) async {
      tester.binding.window.physicalSizeTestValue = maxTabletSize;
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TabletViewWidget), findsOneWidget);
      expect(find.byType(MobileViewWidget), findsNothing);
    });

    testWidgets('should load $TabletViewWidget when the view port is desktop',
        (tester) async {
      tester.binding.window.physicalSizeTestValue = minDesktopSize;
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TabletViewWidget), findsOneWidget);
      expect(find.byType(MobileViewWidget), findsNothing);
    });
  });
}
