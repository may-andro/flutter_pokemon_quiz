import 'package:data/data.dart';
import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:local/local.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';

import '../../mock/repository/pokemon/mocked_pokemon_repository.dart';

void main() {
  group(FetchFavouritePokemonsUseCase, () {
    late MockedPokemonRepository mockedPokemonRepository;
    late FavouritePokemonLocalMapper favouritePokemonLocalMapper;

    late FetchFavouritePokemonsUseCase fetchFavouritePokemonsUseCase;

    setUp(() {
      mockedPokemonRepository = MockedPokemonRepository();
      favouritePokemonLocalMapper = FavouritePokemonLocalMapper();

      fetchFavouritePokemonsUseCase = FetchFavouritePokemonsUseCase(
        mockedPokemonRepository,
        favouritePokemonLocalMapper,
      );
    });

    group('call', () {
      test('should return ${Right<Failure, List<FavouritePokemon>>} ', () {
        final localPokemons = [
          LocalPokemon(index: 1, name: 'name', imageUrl: 'imageUrl'),
          LocalPokemon(index: 2, name: 'name', imageUrl: 'imageUrl'),
        ];
        mockedPokemonRepository.mockGetAllFavoritePokemons(localPokemons);

        final result = fetchFavouritePokemonsUseCase();

        expect(result.isRight(), true);
        expect(
          result.asRight(),
          const [
            FavouritePokemon(index: 1, avatar: 'imageUrl', name: 'name'),
            FavouritePokemon(index: 2, avatar: 'imageUrl', name: 'name')
          ],
        );
      });

      test(
          'should return ${Left<Failure, List<FavouritePokemon>>} when '
          '$PokemonRepository throw exception', () {
        mockedPokemonRepository.mockGetAllFavoritePokemonsThrowsException();

        final result = fetchFavouritePokemonsUseCase();

        expect(result.isLeft(), true);
        expect(result.asLeft(), const Failure(ERROR_SERVER_ID));
      });
    });
  });
}
