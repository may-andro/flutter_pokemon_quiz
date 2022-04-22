import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';
import 'package:guess_pokemon/src/presentation/page/widget/speech_text_widget.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ui_core/ui_core.dart';
import 'package:get_it/get_it.dart';

import '../../../../fake/fake_route.dart';
import '../../../../mock/mocked_navigator_observer.dart';
import '../../../../mock/view_model/mocked_guess_pokemon_view_model.dart';
import '../../../../test_utils/test_data.dart';
import '../../../../test_utils/test_widget_wrapper.dart';

GetIt _locator = GetIt.instance;

void main() {
  setUpAll(() {
    registerFallbackValue(FakedRoute());
  });

  group(SpeechTextWidget, () {
    late MockedGuessPokemonViewModel mockedGuessPokemonViewModel;
    late MockedNavigatorObserver mockedNavigatorObserver;
    late Widget widget;

    setUp(() {
      uiCoreLocator = _locator;
      mockedGuessPokemonViewModel = MockedGuessPokemonViewModel();
      mockedNavigatorObserver = MockedNavigatorObserver();

      _locator.registerFactory<GuessPokemonViewModel>(
        () => mockedGuessPokemonViewModel,
      );

      widget = TestWidgetWrapper(
        navigatorObserver: mockedNavigatorObserver,
        child: ViewModelProviderWidget<GuessPokemonViewModel>(
          builder: (context, _, __) => const SpeechTextWidget(),
        ),
      );
    });

    tearDown(() {
      _locator.reset();
      mockedGuessPokemonViewModel.dispose();
    });

    testWidgets('should show statusLabel from $GuessPokemonViewModel',
        (tester) async {
      mockedGuessPokemonViewModel.mockPokemon(testPokemon);
      mockedGuessPokemonViewModel.mockPokemonName(testPokemon.name);
      mockedGuessPokemonViewModel.mockPokemonTypeColor(Colors.red);
      mockedGuessPokemonViewModel.mockIsPokemonDetailFeatureEnabled(false);
      mockedGuessPokemonViewModel.mockStatusLabel('Press the button and speak');

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(
        find.text(mockedGuessPokemonViewModel.statusLabel, findRichText: true),
        findsOneWidget,
      );
    });

    testWidgets(
        'should set Color for highlighted '
        'text from $GuessPokemonViewModel', (tester) async {
      mockedGuessPokemonViewModel.mockPokemon(testPokemon);
      mockedGuessPokemonViewModel.mockPokemonName(testPokemon.name);
      mockedGuessPokemonViewModel.mockPokemonTypeColor(Colors.red);
      mockedGuessPokemonViewModel.mockIsPokemonDetailFeatureEnabled(false);
      mockedGuessPokemonViewModel.mockStatusLabel(testPokemon.name);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      final textHighlight = tester.firstWidget(
        find.byType(TextHighlight),
      ) as TextHighlight;

      expect(textHighlight.text, mockedGuessPokemonViewModel.statusLabel);
      expect(
        textHighlight
            .words[mockedGuessPokemonViewModel.pokemonName]?.textStyle.color,
        mockedGuessPokemonViewModel.pokemonTypeColor,
      );
    });

    testWidgets(
        'should check ${Feature.pokemon_detail} is enable '
        'when tapped on $TextHighlight', (tester) async {
      mockedGuessPokemonViewModel.mockPokemon(testPokemon);
      mockedGuessPokemonViewModel.mockPokemonName(testPokemon.name);
      mockedGuessPokemonViewModel.mockPokemonTypeColor(Colors.red);
      mockedGuessPokemonViewModel.mockIsPokemonDetailFeatureEnabled(false);
      mockedGuessPokemonViewModel.mockStatusLabel(testPokemon.name);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      final textHighlight = tester.firstWidget(
        find.byType(TextHighlight),
      ) as TextHighlight;
      textHighlight.words[mockedGuessPokemonViewModel.pokemonName]?.onTap();

      verify(
        () => mockedGuessPokemonViewModel.isPokemonDetailFeatureEnabled,
      ).called(1);
    });

    testWidgets(
        'should not call $Navigator '
        'when ${Feature.pokemon_detail} is disabled '
        'and tapped on $TextHighlight', (tester) async {
      mockedGuessPokemonViewModel.mockPokemon(testPokemon);
      mockedGuessPokemonViewModel.mockPokemonName(testPokemon.name);
      mockedGuessPokemonViewModel.mockPokemonTypeColor(Colors.red);
      mockedGuessPokemonViewModel.mockIsPokemonDetailFeatureEnabled(false);
      mockedGuessPokemonViewModel.mockStatusLabel(testPokemon.name);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          mockedGuessPokemonViewModel.statusLabel,
          findRichText: true,
        ),
      );
      await tester.pumpAndSettle();

      final capturedRoute = verify(
        () => mockedNavigatorObserver.didPush(captureAny(), captureAny()),
      ).captured;
      expect(capturedRoute.length, 2);
      expect(
        find.byKey(const Key('pokemon_detail_page')),
        findsNothing,
      );
    });

    testWidgets(
        'should not call $Navigator '
        'when ${Feature.pokemon_detail} is enabled '
        'but pokemon is null '
        '& tapped on $TextHighlight', (tester) async {
      mockedGuessPokemonViewModel.mockPokemon(null);
      mockedGuessPokemonViewModel.mockPokemonName(testPokemon.name);
      mockedGuessPokemonViewModel.mockPokemonTypeColor(Colors.red);
      mockedGuessPokemonViewModel.mockIsPokemonDetailFeatureEnabled(true);
      mockedGuessPokemonViewModel.mockStatusLabel(testPokemon.name);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          mockedGuessPokemonViewModel.statusLabel,
          findRichText: true,
        ),
      );
      await tester.pumpAndSettle();

      final capturedRoute = verify(
        () => mockedNavigatorObserver.didPush(captureAny(), captureAny()),
      ).captured;
      expect(capturedRoute.length, 2);
      expect(
        find.byKey(const Key('pokemon_detail_page')),
        findsNothing,
      );
    });

    testWidgets(
        'should call $Navigator '
        'when ${Feature.pokemon_detail} is enabled '
        'and tapped on $TextHighlight', (tester) async {
      mockedGuessPokemonViewModel.mockPokemon(testPokemon);
      mockedGuessPokemonViewModel.mockPokemonName(testPokemon.name);
      mockedGuessPokemonViewModel.mockPokemonTypeColor(Colors.red);
      mockedGuessPokemonViewModel.mockIsPokemonDetailFeatureEnabled(true);
      mockedGuessPokemonViewModel.mockStatusLabel(testPokemon.name);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          mockedGuessPokemonViewModel.statusLabel,
          findRichText: true,
        ),
      );
      await tester.pumpAndSettle();

      final capturedRoute = verify(
        () => mockedNavigatorObserver.didPush(captureAny(), captureAny()),
      ).captured;
      expect(capturedRoute.length, 4);
      expect(
        find.byKey(const Key('pokemon_detail_page')),
        findsOneWidget,
      );
    });
  });
}
