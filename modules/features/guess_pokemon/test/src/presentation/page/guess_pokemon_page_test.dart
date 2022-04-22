import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_page.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';
import 'package:guess_pokemon/src/presentation/page/widget/desktop_view_widget.dart';
import 'package:guess_pokemon/src/presentation/page/widget/mobile_view_widget.dart';
import 'package:guess_pokemon/src/presentation/page/widget/tablet_view_widget.dart';
import 'package:ui_core/ui_core.dart';

import '../../../mock/view_model/mocked_guess_pokemon_view_model.dart';
import '../../../test_utils/test_data.dart';
import '../../../test_utils/test_device_size.dart';
import '../../../test_utils/test_widget_wrapper.dart';

GetIt _locator = GetIt.instance;

void main() {
  group(GuessPokemonPage, () {
    late MockedGuessPokemonViewModel mockedGuessPokemonViewModel;
    late Widget widget;

    setUp(() {
      uiCoreLocator = _locator;
      mockedGuessPokemonViewModel = MockedGuessPokemonViewModel();

      _locator.registerFactory<GuessPokemonViewModel>(
        () => mockedGuessPokemonViewModel,
      );

      widget = const TestWidgetWrapper(child: GuessPokemonPage());

      mockedGuessPokemonViewModel.mockOnInit();
      mockedGuessPokemonViewModel.mockPokemonImage(testPokemon.imageUrl);
      mockedGuessPokemonViewModel.mockPokemon(testPokemon);
      mockedGuessPokemonViewModel.mockPokemonName(testPokemon.name);
      mockedGuessPokemonViewModel.mockIsAnsweredCorrectly(false);
      mockedGuessPokemonViewModel.mockIsStateLoading(true);
      mockedGuessPokemonViewModel.mockIsStateError(false);
      mockedGuessPokemonViewModel.mockIsStateSuccess(false);
      mockedGuessPokemonViewModel.mockIsListening(false);
      mockedGuessPokemonViewModel.mockViewState(ViewState.loading);
      mockedGuessPokemonViewModel.mockPokemonTypeColor(Colors.red);
      mockedGuessPokemonViewModel.mockStatusLabel('');
    });

    tearDown(() => _locator.reset());

    testWidgets('should load $MobileViewWidget when the view port is mobile',
        (tester) async {
      tester.binding.window.physicalSizeTestValue = maxPhoneSize;
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(MobileViewWidget), findsOneWidget);
      expect(find.byType(DesktopViewWidget), findsNothing);
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
      expect(find.byType(DesktopViewWidget), findsNothing);
    });

    testWidgets('should load $DesktopViewWidget when the view port is desktop',
        (tester) async {
      tester.binding.window.physicalSizeTestValue = minDesktopSize;
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(DesktopViewWidget), findsOneWidget);
      expect(find.byType(TabletViewWidget), findsNothing);
      expect(find.byType(MobileViewWidget), findsNothing);
    });
  });
}
