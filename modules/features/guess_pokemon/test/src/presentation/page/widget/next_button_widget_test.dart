import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';
import 'package:guess_pokemon/src/presentation/page/widget/next_button_widget.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ui_core/ui_core.dart';
import 'package:get_it/get_it.dart';

import '../../../../mock/view_model/mocked_guess_pokemon_view_model.dart';
import '../../../../test_utils/test_widget_wrapper.dart';

GetIt _locator = GetIt.instance;

void main() {
  group(NextButtonWidget, () {
    late MockedGuessPokemonViewModel mockedGuessPokemonViewModel;
    late Widget widget;

    setUp(() {
      uiCoreLocator = _locator;
      mockedGuessPokemonViewModel = MockedGuessPokemonViewModel();

      _locator.registerFactory<GuessPokemonViewModel>(
        () => mockedGuessPokemonViewModel,
      );

      widget = TestWidgetWrapper(
          child: ViewModelProviderWidget<GuessPokemonViewModel>(
        builder: (context, _, __) => const NextButtonWidget(),
      ));
    });

    tearDown(() => _locator.reset());

    testWidgets(
        'should show ${Icons.navigate_next_rounded} '
        'by default', (tester) async {
      mockedGuessPokemonViewModel.mockIsStateError(false);
      mockedGuessPokemonViewModel.mockIsStateLoading(false);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.navigate_next_rounded), findsOneWidget);
    });

    testWidgets(
        'should show ${Icons.cloud_download_rounded} '
        'when ${ViewState.loading}', (tester) async {
      mockedGuessPokemonViewModel.mockIsStateLoading(true);
      mockedGuessPokemonViewModel.mockIsStateError(false);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.cloud_download_rounded), findsOneWidget);
    });

    testWidgets(
        'should show ${Icons.replay_circle_filled} '
        'when ${ViewState.error}', (tester) async {
      mockedGuessPokemonViewModel.mockIsStateLoading(false);
      mockedGuessPokemonViewModel.mockIsStateError(true);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.replay_circle_filled), findsOneWidget);
    });

    testWidgets(
        'should be clickable & call loadPokemon '
        'when viewState is not  ${ViewState.loading}', (tester) async {
      mockedGuessPokemonViewModel.mockIsStateLoading(false);
      mockedGuessPokemonViewModel.mockIsStateError(true);
      mockedGuessPokemonViewModel.mockLoadPokemon();

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      await tester.tap(find.byType(SmallFABWidget));

      verify(mockedGuessPokemonViewModel.loadPokemon).called(1);
    });

    testWidgets(
        'should not loadPokemon and non clickable when'
        ' viewState is ${ViewState.loading}', (tester) async {
      mockedGuessPokemonViewModel.mockIsStateLoading(true);
      mockedGuessPokemonViewModel.mockIsStateError(false);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      await tester.tap(find.byType(SmallFABWidget));

      verifyNever(mockedGuessPokemonViewModel.loadPokemon);
    });
  });
}
