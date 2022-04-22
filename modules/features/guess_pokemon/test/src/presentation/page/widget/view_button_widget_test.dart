import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';
import 'package:guess_pokemon/src/presentation/page/widget/view_button_widget.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ui_core/ui_core.dart';
import 'package:get_it/get_it.dart';

import '../../../../mock/view_model/mocked_guess_pokemon_view_model.dart';
import '../../../../test_utils/test_widget_wrapper.dart';

GetIt _locator = GetIt.instance;

void main() {
  group(ViewButtonWidget, () {
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
        builder: (context, _, __) => const ViewButtonWidget(),
      ));
    });

    tearDown(() => _locator.reset());

    testWidgets(
        'should show ${Icons.visibility_off} '
        'when ${ViewState.success} and isAnsweredCorrectly is false',
        (tester) async {
      mockedGuessPokemonViewModel.mockIsAnsweredCorrectly(false);
      mockedGuessPokemonViewModel.mockIsStateLoading(false);
      mockedGuessPokemonViewModel.mockIsStateError(false);
      mockedGuessPokemonViewModel.mockIsStateSuccess(true);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
    });

    testWidgets(
        'should show ${Icons.visibility} '
        'when ${ViewState.success} and isAnsweredCorrectly is true',
        (tester) async {
      mockedGuessPokemonViewModel.mockIsAnsweredCorrectly(true);
      mockedGuessPokemonViewModel.mockIsStateLoading(false);
      mockedGuessPokemonViewModel.mockIsStateError(false);
      mockedGuessPokemonViewModel.mockIsStateSuccess(true);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });

    testWidgets(
        'should show ${Icons.do_disturb_alt_rounded} '
        'when ${ViewState.loading} and isAnsweredCorrectly is true',
        (tester) async {
      mockedGuessPokemonViewModel.mockIsAnsweredCorrectly(false);
      mockedGuessPokemonViewModel.mockIsStateLoading(true);
      mockedGuessPokemonViewModel.mockIsStateError(false);
      mockedGuessPokemonViewModel.mockIsStateSuccess(false);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.do_disturb_alt_rounded), findsOneWidget);
    });

    testWidgets(
        'should show ${Icons.broken_image} '
        'when ${ViewState.error} and isAnsweredCorrectly is true',
        (tester) async {
      mockedGuessPokemonViewModel.mockIsAnsweredCorrectly(false);
      mockedGuessPokemonViewModel.mockIsStateLoading(false);
      mockedGuessPokemonViewModel.mockIsStateError(true);
      mockedGuessPokemonViewModel.mockIsStateSuccess(false);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.broken_image), findsOneWidget);
    });

    testWidgets(
        'should be clickable and call viewPokemon '
        'when ${ViewState.success}', (tester) async {
      mockedGuessPokemonViewModel.mockIsAnsweredCorrectly(false);
      mockedGuessPokemonViewModel.mockIsStateLoading(false);
      mockedGuessPokemonViewModel.mockIsStateError(false);
      mockedGuessPokemonViewModel.mockIsStateSuccess(true);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      await tester.tap(find.byType(SmallFABWidget));

      verify(mockedGuessPokemonViewModel.viewPokemon).called(1);
    });

    testWidgets(
        'should be un clickable '
        'when viewState is not ${ViewState.success}', (tester) async {
      mockedGuessPokemonViewModel.mockIsAnsweredCorrectly(false);
      mockedGuessPokemonViewModel.mockIsStateLoading(false);
      mockedGuessPokemonViewModel.mockIsStateError(false);
      mockedGuessPokemonViewModel.mockIsStateSuccess(false);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      await tester.tap(find.byType(SmallFABWidget));

      verifyNever(mockedGuessPokemonViewModel.viewPokemon);
    });
  });
}
