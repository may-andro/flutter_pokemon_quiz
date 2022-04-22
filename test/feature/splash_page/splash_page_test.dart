import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_quiz/feature/splash_page/splash_page.dart';
import 'package:pokemon_quiz/feature/splash_page/splash_view_model.dart';
import 'package:pokemon_quiz/feature/splash_page/widget/splash_desktop_widget.dart';
import 'package:pokemon_quiz/feature/splash_page/widget/splash_mobile_widget.dart';
import 'package:pokemon_quiz/feature/splash_page/widget/splash_tablet_widget.dart';
import 'package:ui_core/ui_core.dart';

import '../../mock/view_model/mocked_splash_view_model.dart';
import '../../test_utils/test_device_size.dart';
import '../../test_utils/test_widget_wrapper.dart';

GetIt _locator = GetIt.instance;

void main() {
  group(SplashPage, () {
    late BuildConfig buildConfig;
    late MockedSplashViewModel mockedSplashViewModel;
    late Widget widget;

    setUp(() {
      uiCoreLocator = _locator;
      mockedSplashViewModel = MockedSplashViewModel();
      buildConfig = BuildConfig(
        buildFlavor: BuildFlavor.jhoto,
        buildEnvironment: BuildEnvironment.debug,
      );

      _locator.registerFactory<SplashViewModel>(() => mockedSplashViewModel);
      _locator.registerLazySingleton<BuildConfig>(() => buildConfig);

      widget = const TestWidgetWrapper(child: SplashPage());

      mockedSplashViewModel.mockIsPokedexFeatureEnabled(true);
    });

    tearDown(() => _locator.reset());

    testWidgets('should load $SplashMobileWidget when the view port is mobile',
        (tester) async {
      tester.binding.window.physicalSizeTestValue = maxPhoneSize;
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(SplashMobileWidget), findsOneWidget);
      expect(find.byType(SplashTabletWidget), findsNothing);
      expect(find.byType(SplashDesktopWidget), findsNothing);
    });

    testWidgets('should load $SplashTabletWidget when the view port is tablet',
        (tester) async {
      tester.binding.window.physicalSizeTestValue = maxTabletSize;
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(SplashTabletWidget), findsOneWidget);
      expect(find.byType(SplashMobileWidget), findsNothing);
      expect(find.byType(SplashDesktopWidget), findsNothing);
    });

    testWidgets(
        'should load $SplashDesktopWidget when the view port is desktop',
        (tester) async {
      tester.binding.window.physicalSizeTestValue = minDesktopSize;
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(SplashDesktopWidget), findsOneWidget);
      expect(find.byType(SplashTabletWidget), findsNothing);
      expect(find.byType(SplashMobileWidget), findsNothing);
    });
  });
}
