import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon_detail/src/presentation/page/pokemon_detail_view_model.dart';
import 'package:ui_core/ui_core.dart';

class MockedPokemonDetailViewModel extends Mock
    implements PokemonDetailViewModel {
  void mockPokemonImage(String expected) {
    when(() => pokemonImage).thenReturn(expected);
  }

  void mockPokemonName(String expected) {
    when(() => pokemonName).thenReturn(expected);
  }

  void mockPokemonIndex(int expected) {
    when(() => pokemonIndex).thenReturn(expected);
  }

  void mockSelectedTabIndex(int expected) {
    when(() => selectedTabIndex).thenReturn(expected);
  }

  void mockPokemonTypeColor(Color expected) {
    when(() => pokemonTypeColor).thenReturn(expected);
  }

  void mockPokemonStats(List<PokemonStat> expected) {
    when(() => pokemonStats).thenReturn(expected);
  }

  void mockPokemonTypeImages(List<String> expected) {
    when(() => pokemonTypeImages).thenReturn(expected);
  }

  void mockIsFavorite(bool expected) {
    when(() => isFavorite).thenReturn(expected);
  }

  void mockViewState(ViewState expected) {
    when(() => viewState).thenReturn(expected);
  }

  void mockIsStateLoading(bool expected) {
    when(() => isStateLoading).thenReturn(expected);
  }

  void mockIsStateSuccess(bool expected) {
    when(() => isStateSuccess).thenReturn(expected);
  }

  void mockIsStateError(bool expected) {
    when(() => isStateError).thenReturn(expected);
  }
}
