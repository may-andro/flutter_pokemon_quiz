import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/src/presentation/pages/pokedex_page.dart';
import 'package:pokedex/src/presentation/pages/pokedex_view_model.dart';
import 'package:pokedex/src/presentation/pages/widgets/pokdex_success_widget.dart';
import 'package:pokedex/src/presentation/pages/widgets/pokedex_error_widget.dart';
import 'package:pokedex/src/presentation/pages/widgets/pokedex_loading_widget.dart';
import 'package:ui_core/ui_core.dart';
import 'package:get_it/get_it.dart';

import '../fake/fake_route.dart';
import '../mock/mocked_navigator_observer.dart';
import '../mock/view_model/mocked_pokedex_view_model.dart';
import '../test_utils/test_data.dart';
import '../test_utils/test_widget_wrapper.dart';

GetIt _locator = GetIt.instance;

void main() {
  setUpAll(() {
    registerFallbackValue(FakedRoute());
  });

  group(PokedexPage, () {
    late MockedNavigatorObserver mockedNavigatorObserver;
    late MockedPokedexViewModel mockedPokedexViewModel;
    late Widget widget;

    setUp(() {
      uiCoreLocator = _locator;
      mockedNavigatorObserver = MockedNavigatorObserver();
      mockedPokedexViewModel = MockedPokedexViewModel();
      mockedPokedexViewModel.mockOnInit();
      mockedPokedexViewModel.mockViewState(ViewState.loading);

      _locator.registerFactory<PokedexViewModel>(
        () => mockedPokedexViewModel,
      );

      widget = TestWidgetWrapper(
        navigatorObserver: mockedNavigatorObserver,
        child: const PokedexPage(),
      );
    });

    tearDown(() {
      _locator.reset();
      mockedPokedexViewModel.dispose();
    });

    testWidgets('should load pokeball images', (tester) async {
      mockedPokedexViewModel.mockPokedex(testPokedex);

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byKey(const Key('top_pokeball')), findsOneWidget);
      expect(find.byKey(const Key('bottom_pokeball')), findsOneWidget);
    });

    testWidgets('should load close $SmallFABWidget', (tester) async {
      mockedPokedexViewModel.mockPokedex(testPokedex);

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(SmallFABWidget), findsOneWidget);
    });

    testWidgets(
        'should pop '
        'when close $SmallFABWidget clicked', (tester) async {
      mockedPokedexViewModel.mockPokedex(testPokedex);

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 1));

      await tester.tap(find.byType(SmallFABWidget));
      await tester.pumpAndSettle();

      verify(
        () => mockedNavigatorObserver.didPop(captureAny(), captureAny()),
      ).called(1);
    });

    testWidgets('should load $PokedexLoadingWidget when ${ViewState.loading}',
        (tester) async {
      mockedPokedexViewModel.mockPokedex(testPokedex);

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(PokedexLoadingWidget), findsOneWidget);
    });

    testWidgets('should load $PokedexSuccessWidget when ${ViewState.success}',
        (tester) async {
      mockedPokedexViewModel.mockPokedex(testPokedex);
      mockedPokedexViewModel.mockViewState(ViewState.success);

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(PokedexSuccessWidget), findsOneWidget);
    });

    testWidgets('should load $PokedexErrorWidget when ${ViewState.error}',
        (tester) async {
      mockedPokedexViewModel.mockErrorCode(1);
      mockedPokedexViewModel.mockViewState(ViewState.error);

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(PokedexErrorWidget), findsOneWidget);
    });
  });
}
