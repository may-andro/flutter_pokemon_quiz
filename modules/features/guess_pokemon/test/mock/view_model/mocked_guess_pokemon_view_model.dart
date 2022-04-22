import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:guess_pokemon/src/presentation/page/guess_pokemon_view_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ui_core/ui_core.dart';

class MockedGuessPokemonViewModel extends Mock
    implements GuessPokemonViewModel {
  void mockStatusLabel(String expected) {
    when(() => statusLabel).thenReturn(expected);
  }

  void mockIsListening(bool expected) {
    when(() => isListening).thenReturn(expected);
  }

  void mockIsAnsweredCorrectly(bool expected) {
    when(() => isAnsweredCorrectly).thenReturn(expected);
  }

  void mockPokemonImage(String expected) {
    when(() => pokemonImage).thenReturn(expected);
  }

  void mockPokemonName(String expected) {
    when(() => pokemonName).thenReturn(expected);
  }

  void mockPokemon(Pokemon? expected) {
    when(() => pokemon).thenReturn(expected);
  }

  void mockPokemonTypeColor(Color expected) {
    when(() => pokemonTypeColor).thenReturn(expected);
  }

  void mockIsPokemonDetailFeatureEnabled(bool expected) {
    when(() => isPokemonDetailFeatureEnabled).thenReturn(expected);
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

  void mockLoadPokemon() {
    when(loadPokemon).thenAnswer((_) => Future.value());
  }

  void mockOnInit() {
    when(onInit).thenAnswer((_) => Future.value());
  }
}
