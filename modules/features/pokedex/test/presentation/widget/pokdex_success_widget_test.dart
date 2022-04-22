import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/src/presentation/pages/pokedex_view_model.dart';
import 'package:pokedex/src/presentation/pages/widgets/pokdex_success_widget.dart';
import 'package:ui_core/ui_core.dart';
import 'package:get_it/get_it.dart';

import '../../mock/view_model/mocked_pokedex_view_model.dart';
import '../../test_utils/test_data.dart';
import '../../test_utils/test_device_size.dart';
import '../../test_utils/test_widget_wrapper.dart';

GetIt _locator = GetIt.instance;

void main() {
  group(PokedexSuccessWidget, () {
    late MockedPokedexViewModel mockedPokedexViewModel;
    late Widget widget;

    setUp(() {
      uiCoreLocator = _locator;
      mockedPokedexViewModel = MockedPokedexViewModel();
      mockedPokedexViewModel.mockPokedex(testPokedex);

      _locator.registerFactory<PokedexViewModel>(
        () => mockedPokedexViewModel,
      );

      widget = TestWidgetWrapper(
        child: ViewModelProviderWidget<PokedexViewModel>(
          builder: (context, _, __) => const PokedexSuccessWidget(),
        ),
      );
    });

    tearDown(() => _locator.reset());

    testWidgets('should show crossAxisCount: 3 when the view port is mobile',
        (tester) async {
      tester.binding.window.physicalSizeTestValue = maxPhoneSize;
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byKey(const Key('mobile_view')), findsOneWidget);
    });

    testWidgets('should show crossAxisCount: 5 when the view port is tablet',
        (tester) async {
      tester.binding.window.physicalSizeTestValue = maxTabletSize;
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byKey(const Key('tablet_view')), findsOneWidget);
    });

    testWidgets('should show crossAxisCount: 7 when the view port is desktop',
        (tester) async {
      tester.binding.window.physicalSizeTestValue = minDesktopSize;
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byKey(const Key('desktop_view')), findsOneWidget);
    });

    testWidgets('should show items list', (tester) async {
      tester.binding.window.physicalSizeTestValue = minDesktopSize;
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 1));

      expect(
        find.byType(ColorFilteredImageWidget),
        findsNWidgets(mockedPokedexViewModel.pokedex.pokemons.length),
      );
    });
  });
}
