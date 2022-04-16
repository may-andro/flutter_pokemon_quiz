import 'package:domain/src/mapper/pokemon/pokemon_remote_mapper.dart';
import 'package:domain/src/model/pokemon/pokemon.dart';
import 'package:mocktail/mocktail.dart';

class MockPokemonRemoteMapper extends Mock implements PokemonRemoteMapper {
  void mockMapFromEntityToModel(Pokemon expected) {
    when(() => mapFromEntityToModel(any())).thenReturn(expected);
  }
}
