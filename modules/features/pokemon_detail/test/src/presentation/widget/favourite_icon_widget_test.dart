import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ui_core/ui_core.dart';
import 'package:pokemon_detail/src/presentation/page/pokemon_detail_view_model.dart';
import 'package:pokemon_detail/src/presentation/page/widget/favourite_icon_widget.dart';

import '../../../mock/view_model/mocked_pokemon_detail_view_model.dart';
import '../../../test_utils/test_widget_wrapper.dart';

GetIt _locator = GetIt.instance;

void main() {
  group(FavouriteIconWidget, () {
    late MockedPokemonDetailViewModel mockedPokemonDetailViewModel;
    late Widget widget;

    setUp(() {
      uiCoreLocator = _locator;
      mockedPokemonDetailViewModel = MockedPokemonDetailViewModel();
      mockedPokemonDetailViewModel.mockPokemonTypeColor(Colors.white);

      _locator.registerFactory<PokemonDetailViewModel>(
        () => mockedPokemonDetailViewModel,
      );

      widget = TestWidgetWrapper(
          child: ViewModelProviderWidget<PokemonDetailViewModel>(
        builder: (context, _, __) => const FavouriteIconWidget(iconSize: 24),
      ));
    });

    tearDown(() => _locator.reset());

    testWidgets(
        'should show ${Icons.favorite} '
        'when IsFavorite true', (tester) async {
      mockedPokemonDetailViewModel.mockIsFavorite(true);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.favorite), findsOneWidget);
      expect(find.byIcon(Icons.favorite_border), findsNothing);
    });

    testWidgets(
        'should show ${Icons.favorite_border} '
        'when IsFavorite false', (tester) async {
      mockedPokemonDetailViewModel.mockIsFavorite(false);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.favorite_border), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsNothing);
    });

    testWidgets(
        'should toggleFavoritePokemon '
        'when clicked & IsFavorite true', (tester) async {
      mockedPokemonDetailViewModel.mockIsFavorite(true);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.favorite));

      verify(mockedPokemonDetailViewModel.toggleFavoritePokemon).called(1);
    });

    testWidgets(
        'should toggleFavoritePokemon '
        'when clicked & IsFavorite true', (tester) async {
      mockedPokemonDetailViewModel.mockIsFavorite(true);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.favorite));

      verify(mockedPokemonDetailViewModel.toggleFavoritePokemon).called(1);
    });

    testWidgets(
        'should toggleFavoritePokemon '
        'when clicked & IsFavorite false', (tester) async {
      mockedPokemonDetailViewModel.mockIsFavorite(false);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.favorite_border));

      verify(mockedPokemonDetailViewModel.toggleFavoritePokemon).called(1);
    });
  });
}
