import 'package:data/data.dart';
import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:local/local.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';

import '../../mock/repository/pokemon/mocked_pokemon_repository.dart';

void main() {
  group(FetchFavoritePokemonsUseCase, () {
    late MockedPokemonRepository mockedPokemonRepository;
    late CapturedPokemonLocalMapper favouritePokemonLocalMapper;

    late FetchFavoritePokemonsUseCase fetchFavouritePokemonsUseCase;

    setUp(() {
      mockedPokemonRepository = MockedPokemonRepository();
      favouritePokemonLocalMapper = CapturedPokemonLocalMapper();

      fetchFavouritePokemonsUseCase = FetchFavoritePokemonsUseCase(
        mockedPokemonRepository,
        favouritePokemonLocalMapper,
      );
    });

    group('call', () {
      test('should return ${Right<Failure, List<CapturedPokemon>>} ', () {
        final localPokemons = [
          LocalPokemon(index: 1, name: 'name', imageUrl: 'imageUrl'),
          LocalPokemon(index: 2, name: 'name', imageUrl: 'imageUrl'),
        ];
        mockedPokemonRepository.mockGetPokemons(localPokemons);

        final result = fetchFavouritePokemonsUseCase();

        expect(result.isRight(), true);
        expect(
          result.asRight(),
          const [
            CapturedPokemon(
              index: 1,
              avatar: 'imageUrl',
              name: 'name',
              isCaptured: true,
            ),
            CapturedPokemon(
              index: 2,
              avatar: 'imageUrl',
              name: 'name',
              isCaptured: true,
            )
          ],
        );
      });

      test(
          'should return ${Left<Failure, List<CapturedPokemon>>} when '
          '$PokemonRepository throw exception', () {
        mockedPokemonRepository.mockGetPokemonsThrowsException();

        final result = fetchFavouritePokemonsUseCase();

        expect(result.isLeft(), true);
        expect(result.asLeft(), const Failure(ERROR_SERVER_ID));
      });
    });
  });
}
