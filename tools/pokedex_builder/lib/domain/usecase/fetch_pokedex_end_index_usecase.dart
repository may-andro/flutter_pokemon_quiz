import 'package:pokedex_builder/exceptions/exceptions.dart';

class FetchPokedexEndIndexUseCase {
  const FetchPokedexEndIndexUseCase();

  int call(final String region) {
    switch (region) {
      case 'kanto':
        return 151;
      case 'jhoto':
        return 251;
      default:
        throw UnknownRegionException();
    }
  }
}
