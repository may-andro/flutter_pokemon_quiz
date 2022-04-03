import 'package:data/data.dart';
import 'package:local/local.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class MockedPokemonRepository extends Mock implements PokemonRepository {
  void mockGetAllFavoritePokemons(List<LocalPokemon> expected) {
    when(getAllFavoritePokemons).thenReturn(expected);
  }

  void mockGetAllFavoritePokemonsThrowsException() {
    when(getAllFavoritePokemons).thenThrow(Exception());
  }

  void mockFetchPokemon(RemoteExtendedPokemon expected) {
    when(() => fetchPokemon(any())).thenAnswer((_) => Future.value(expected));
  }

  void mockFetchPokemonThrowsException() {
    when(() => fetchPokemon(any())).thenThrow(Exception());
  }

  void mockPutFavoritePokemon() {
    when(() => putFavoritePokemon(any())).thenReturn(null);
  }

  void mockPutFavoritePokemonThrowException() {
    when(() => putFavoritePokemon(any())).thenThrow(Exception());
  }

  void mockRemoveFavoritePokemonThrowException() {
    when(() => removeFavoritePokemon(any())).thenThrow(Exception());
  }
}
