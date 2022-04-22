import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon_quiz/feature/splash_page/splash_view_model.dart';
import 'package:pokemon_quiz/feature/splash_page/widget/pokedex_button_widget.dart';
import 'package:ui_core/ui_core.dart';
import 'package:get_it/get_it.dart';

import '../../../fake/fake_route.dart';
import '../../../mock/mocked_navigator_observer.dart';
import '../../../mock/view_model/mocked_splash_view_model.dart';
import '../../../test_utils/test_widget_wrapper.dart';

GetIt _locator = GetIt.instance;

void main() {
  setUpAll(() {
    registerFallbackValue(FakedRoute());
  });

  group(PokedexButtonWidget, () {
    late MockedNavigatorObserver mockedNavigatorObserver;
    late MockedSplashViewModel mockedSplashViewModel;
    late Widget widget;

    setUp(() {
      uiCoreLocator = _locator;
      mockedNavigatorObserver = MockedNavigatorObserver();
      mockedSplashViewModel = MockedSplashViewModel();

      _locator.registerFactory<SplashViewModel>(
        () => mockedSplashViewModel,
      );

      widget = TestWidgetWrapper(
        navigatorObserver: mockedNavigatorObserver,
        child: ViewModelProviderWidget<SplashViewModel>(
          builder: (context, _, __) => const PokedexButtonWidget(),
        ),
      );
    });

    tearDown(() => _locator.reset());

    testWidgets(
        'should show $SizedBox '
        'when isPokedexFeatureEnabled return false', (tester) async {
      mockedSplashViewModel.mockIsPokedexFeatureEnabled(false);

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets(
        'should show $SmallFABWidget '
        'when isPokedexFeatureEnabled return true', (tester) async {
      mockedSplashViewModel.mockIsPokedexFeatureEnabled(true);

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(SmallFABWidget), findsOneWidget);
    });

    testWidgets(
        'should navigate to Pokemon Detail '
        'when clicked & isPokedexFeatureEnabled is true', (tester) async {
      mockedSplashViewModel.mockIsPokedexFeatureEnabled(true);

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 1));

      verify(
        () => mockedNavigatorObserver.didPush(captureAny(), captureAny()),
      ).called(1);

      await tester.tap(find.byType(SmallFABWidget));
      await tester.pump(const Duration(seconds: 1));

      verify(
        () => mockedNavigatorObserver.didPush(captureAny(), captureAny()),
      ).called(1);
    });
  });
}
