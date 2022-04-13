import 'package:pokedex_builder/exceptions/exceptions.dart';

class FetchPokedexStartIndexUseCase {
  const FetchPokedexStartIndexUseCase();

  int call(final String region) {
    switch (region) {
      case 'kanto':
        return 1;
      case 'jhoto':
        return 152;
      default:
        throw UnknownRegionException();
    }
  }
}
