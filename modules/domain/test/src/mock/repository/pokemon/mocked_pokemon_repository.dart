import 'package:data/data.dart';
import 'package:local/local.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class MockedPokemonRepository extends Mock implements PokemonRepository {
  void mockGetPokemons(List<LocalPokemon> expected) {
    when(getPokemons).thenReturn(expected);
  }

  void mockGetPokemonsThrowsException() {
    when(getPokemons).thenThrow(Exception());
  }

  void mockFetchPokemon(RemoteExtendedPokemon expected) {
    when(() => fetchPokemon(any())).thenAnswer((_) => Future.value(expected));
  }

  void mockFetchPokemonThrowsException() {
    when(() => fetchPokemon(any())).thenThrow(Exception());
  }

  void mockPutPokemon(int expected) {
    when(() => putPokemon(any())).thenReturn(expected);
  }

  void mockPutPokemonThrowException() {
    when(() => putPokemon(any())).thenThrow(Exception());
  }

  void mockRemovePokemonThrowException() {
    when(() => removePokemon(any())).thenThrow(Exception());
  }

  void mockQueryIsCapturedPokemon(bool expected) {
    when(() => queryIsCapturedPokemon(any())).thenReturn(expected);
  }

  void mockQueryIsFavoritePokemon(bool expected) {
    when(() => queryIsFavoritePokemon(any())).thenReturn(expected);
  }
}
