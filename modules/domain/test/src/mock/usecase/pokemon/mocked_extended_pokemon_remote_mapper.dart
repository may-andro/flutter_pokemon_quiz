import 'package:domain/src/mapper/pokemon/extended_pokemon_remote_mapper.dart';
import 'package:domain/src/model/pokemon/pokemon.dart';
import 'package:mocktail/mocktail.dart';

class MockedExtendedPokemonRemoteMapper extends Mock
    implements ExtendedPokemonRemoteMapper {
  void mockMapFromEntityToModel(Pokemon expected) {
    when(() => mapFromEntityToModel(any())).thenReturn(expected);
  }
}
