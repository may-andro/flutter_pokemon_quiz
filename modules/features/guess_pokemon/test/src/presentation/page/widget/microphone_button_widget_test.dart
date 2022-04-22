import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';
import 'package:guess_pokemon/src/presentation/page/widget/microphone_button_widget.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ui_core/ui_core.dart';
import 'package:get_it/get_it.dart';

import '../../../../mock/view_model/mocked_guess_pokemon_view_model.dart';
import '../../../../test_utils/test_widget_wrapper.dart';

GetIt _locator = GetIt.instance;

void main() {
  group(MicrophoneButtonWidget, () {
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
        builder: (context, _, __) => const MicrophoneButtonWidget(),
      ));
    });

    tearDown(() => _locator.reset());

    testWidgets(
        'should show ${Icons.mic_none} '
        'by default', (tester) async {
      mockedGuessPokemonViewModel.mockIsListening(false);
      mockedGuessPokemonViewModel.mockIsAnsweredCorrectly(false);
      mockedGuessPokemonViewModel.mockIsStateLoading(false);
      mockedGuessPokemonViewModel.mockIsStateError(false);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.mic_none), findsOneWidget);
    });

    testWidgets(
        'should show ${Icons.done_all_sharp} '
        'when isAnsweredCorrectly is true', (tester) async {
      mockedGuessPokemonViewModel.mockIsListening(false);
      mockedGuessPokemonViewModel.mockIsAnsweredCorrectly(true);
      mockedGuessPokemonViewModel.mockIsStateLoading(false);
      mockedGuessPokemonViewModel.mockIsStateError(false);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.done_all_sharp), findsOneWidget);
    });

    testWidgets(
        'should show ${Icons.downloading} '
        'when ${ViewState.loading}', (tester) async {
      mockedGuessPokemonViewModel.mockIsListening(false);
      mockedGuessPokemonViewModel.mockIsAnsweredCorrectly(false);
      mockedGuessPokemonViewModel.mockIsStateLoading(true);
      mockedGuessPokemonViewModel.mockIsStateError(false);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.downloading), findsOneWidget);
    });

    testWidgets(
        'should show ${Icons.warning} '
        'when ${ViewState.error}', (tester) async {
      mockedGuessPokemonViewModel.mockIsListening(false);
      mockedGuessPokemonViewModel.mockIsAnsweredCorrectly(false);
      mockedGuessPokemonViewModel.mockIsStateLoading(false);
      mockedGuessPokemonViewModel.mockIsStateError(true);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.warning), findsOneWidget);
    });

    testWidgets(
        'should show ${Icons.warning} '
        'when ${ViewState.error}', (tester) async {
      mockedGuessPokemonViewModel.mockIsListening(false);
      mockedGuessPokemonViewModel.mockIsAnsweredCorrectly(false);
      mockedGuessPokemonViewModel.mockIsStateLoading(false);
      mockedGuessPokemonViewModel.mockIsStateError(true);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.warning), findsOneWidget);
    });

    testWidgets(
        'should isClickable false '
        'when isAnsweredCorrectly is true', (tester) async {
      mockedGuessPokemonViewModel.mockIsListening(false);
      mockedGuessPokemonViewModel.mockIsAnsweredCorrectly(true);
      mockedGuessPokemonViewModel.mockIsStateLoading(false);
      mockedGuessPokemonViewModel.mockIsStateError(false);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      await tester.tap(find.byType(LargeFABWidget));

      verifyNever(mockedGuessPokemonViewModel.listenToSpeech);
    });

    testWidgets(
        'should isClickable false '
        'when  ${ViewState.error}', (tester) async {
      mockedGuessPokemonViewModel.mockIsListening(false);
      mockedGuessPokemonViewModel.mockIsAnsweredCorrectly(false);
      mockedGuessPokemonViewModel.mockIsStateLoading(false);
      mockedGuessPokemonViewModel.mockIsStateError(true);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      await tester.tap(find.byType(LargeFABWidget));

      verifyNever(mockedGuessPokemonViewModel.listenToSpeech);
    });

    testWidgets(
        'should isClickable false '
        'when  ${ViewState.loading}', (tester) async {
      mockedGuessPokemonViewModel.mockIsListening(false);
      mockedGuessPokemonViewModel.mockIsAnsweredCorrectly(false);
      mockedGuessPokemonViewModel.mockIsStateLoading(true);
      mockedGuessPokemonViewModel.mockIsStateError(false);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      await tester.tap(find.byType(LargeFABWidget));

      verifyNever(mockedGuessPokemonViewModel.listenToSpeech);
    });

    testWidgets('should listenToSpeech when isClickable', (tester) async {
      mockedGuessPokemonViewModel.mockIsAnsweredCorrectly(false);
      mockedGuessPokemonViewModel.mockIsListening(false);
      mockedGuessPokemonViewModel.mockIsStateLoading(false);
      mockedGuessPokemonViewModel.mockIsStateError(false);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      await tester.tap(find.byType(LargeFABWidget));

      verify(mockedGuessPokemonViewModel.listenToSpeech).called(1);
    });
  });
}
