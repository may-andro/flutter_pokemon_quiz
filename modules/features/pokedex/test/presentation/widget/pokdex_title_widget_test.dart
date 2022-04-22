import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/src/presentation/pages/pokedex_view_model.dart';
import 'package:pokedex/src/presentation/pages/widgets/pokedex_title_widget.dart';
import 'package:ui_core/ui_core.dart';
import 'package:get_it/get_it.dart';

import '../../mock/view_model/mocked_pokedex_view_model.dart';
import '../../test_utils/test_widget_wrapper.dart';

GetIt _locator = GetIt.instance;

void main() {
  group(PokedexTitleWidget, () {
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
        builder: (context, _, __) => const PokedexTitleWidget(),
      ));
    });

    tearDown(() => _locator.reset());

    testWidgets('should show image and divider', (tester) async {
      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(Divider), findsOneWidget);
    });
  });
}
