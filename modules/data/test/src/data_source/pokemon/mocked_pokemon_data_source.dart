import 'package:data/src/data_source/pokemon/pokemon_data_source.dart';
import 'package:local/local.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class MockedPokemonDataSource extends Mock implements PokemonDataSource {
  void mockGetAllFavoritePokemons(List<LocalPokemon?> expected) {
    when(getAllFavoritePokemons).thenReturn(expected);
  }

  void mockFetchPokemon(RemoteExtendedPokemon expected) {
    when(() => fetchPokemon(any())).thenAnswer((_) => Future.value(expected));
  }
}
