import 'package:domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class MockedPokemonRepository extends Mock implements PokemonRepository {
  void mockFetchPokedex(List<Pokemon> expected) {
    when(() => fetchPokedex(any())).thenAnswer((invocation) async => expected);
  }

  void mockFetchPokedexThrowsException() {
    when(() => fetchPokedex(any())).thenThrow(Exception());
  }

  void mockFetchPokemon(Pokemon expected) {
    when(() => fetchPokemon(any())).thenAnswer((_) => Future.value(expected));
  }

  void mockFetchPokemonThrowsException() {
    when(() => fetchPokemon(any())).thenThrow(Exception());
  }

  void mockAddToFavorites(int expected) {
    when(() => addToFavorites(any())).thenReturn(expected);
  }

  void mockAddToFavoritesThrowException() {
    when(() => addToFavorites(any())).thenThrow(Exception());
  }

  void mockIsFavoritePokemon(bool expected) {
    when(() => isFavoritePokemon(any())).thenReturn(expected);
  }

  void mockRemoveFromFavorites(int expected) {
    when(() => removeFromFavorites(any())).thenReturn(expected);
  }

  void mockRemoveFromFavoritesThrowException() {
    when(() => removeFromFavorites(any())).thenThrow(Exception());
  }

  void mockAddToCaptured(int expected) {
    when(() => addToCaptured(any())).thenReturn(expected);
  }

  void mockAddToCapturedThrowException() {
    when(() => addToCaptured(any())).thenThrow(Exception());
  }

  void mockIsCapturedPokemon(bool expected) {
    when(() => isCapturedPokemon(any())).thenReturn(expected);
  }
}
