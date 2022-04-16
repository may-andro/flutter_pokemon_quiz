import 'package:domain/src/mapper/pokedex/pokedex_remote_mapper.dart';
import 'package:domain/src/model/pokedex/pokedex.dart';
import 'package:mocktail/mocktail.dart';

class MockPokedexRemoteMapper extends Mock implements PokedexRemoteMapper {
  void mockMapFromEntityToModel(Pokedex expected) {
    when(() => mapFromEntityToModel(any())).thenReturn(expected);
  }
}
