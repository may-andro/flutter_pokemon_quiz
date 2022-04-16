import 'package:data/src/data_source/pokemon/pokemon_data_source.dart';
import 'package:local/local.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class MockedPokemonDataSource extends Mock implements PokemonDataSource {
  void mockGetPokemons(List<LocalPokemon> expected) {
    when(getPokemons).thenReturn(expected);
  }

  void mockFetchPokemon(RemoteExtendedPokemon expected) {
    when(() => fetchPokemon(any())).thenAnswer((_) => Future.value(expected));
  }

  void mockQueryPokemon(List<LocalPokemon> expected) {
    when(() => queryPokemon(any())).thenReturn(expected);
  }

  void mockPutPokemon(LocalPokemon localPokemon) {
    when(() => putPokemon(localPokemon)).thenReturn(localPokemon.id);
  }

  void mockRemovePokemon(bool expected) {
    when(() => removePokemon(any())).thenReturn(expected);
  }
}
