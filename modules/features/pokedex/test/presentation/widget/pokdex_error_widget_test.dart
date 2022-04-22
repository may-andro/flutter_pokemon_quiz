import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/src/presentation/pages/pokedex_view_model.dart';
import 'package:pokedex/src/presentation/pages/widgets/pokedex_error_widget.dart';
import 'package:ui_core/ui_core.dart';
import 'package:get_it/get_it.dart';

import '../../mock/view_model/mocked_pokedex_view_model.dart';
import '../../test_utils/test_widget_wrapper.dart';

GetIt _locator = GetIt.instance;

void main() {
  group(PokedexErrorWidget, () {
    late MockedPokedexViewModel mockedPokedexViewModel;
    late Widget widget;

    setUp(() {
      uiCoreLocator = _locator;
      mockedPokedexViewModel = MockedPokedexViewModel();

      _locator.registerFactory<PokedexViewModel>(
        () => mockedPokedexViewModel,
      );

      widget = TestWidgetWrapper(
          child: ViewModelProviderWidget<PokedexViewModel>(
        builder: (context, _, __) => const PokedexErrorWidget(error: 'Error'),
      ));
    });

    tearDown(() => _locator.reset());

    testWidgets('should show $ErrorPageWidget ', (tester) async {
      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(ErrorPageWidget), findsOneWidget);
      expect(find.text('Error'), findsOneWidget);
    });
  });
}
