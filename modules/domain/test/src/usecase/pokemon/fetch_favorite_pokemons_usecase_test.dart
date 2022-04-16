import 'package:domain/src/model/model.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';

import '../../mock/usecase/pokedex/mocked_fetch_pokedex_usecase.dart';

void main() {
  group(FetchFavoritePokemonsUseCase, () {
    late MockedFetchPokedexUseCase mockedFetchPokedexUseCase;

    late FetchFavoritePokemonsUseCase fetchFavouritePokemonsUseCase;

    setUp(() {
      mockedFetchPokedexUseCase = MockedFetchPokedexUseCase();

      fetchFavouritePokemonsUseCase = FetchFavoritePokemonsUseCase(
        mockedFetchPokedexUseCase,
      );
    });

    group('call', () {
      test('should return ${Right<Failure, List<Pokemon>>} ', () async {
        const pokemons = [
          Pokemon(
            index: 1,
            name: 'name',
            baseExperience: 1,
            weight: 1,
            height: 1,
            imageUrl: 'imageUrl',
            abilities: [],
            moves: [],
            types: [],
            stats: [],
            isCaptured: true,
            isFavorite: true,
          ),
          Pokemon(
            index: 2,
            name: 'name',
            baseExperience: 1,
            weight: 1,
            height: 1,
            imageUrl: 'imageUrl',
            abilities: [],
            moves: [],
            types: [],
            stats: [],
            isCaptured: true,
            isFavorite: false,
          )
        ];
        const pokedex = Pokedex(pokemons: pokemons);
        mockedFetchPokedexUseCase.mockRightCall(pokedex);

        final result = await fetchFavouritePokemonsUseCase('');

        expect(result.isRight(), true);
        expect(
          result.asRight(),
          const [
            Pokemon(
              index: 1,
              name: 'name',
              baseExperience: 1,
              weight: 1,
              height: 1,
              imageUrl: 'imageUrl',
              abilities: [],
              moves: [],
              types: [],
              stats: [],
              isCaptured: true,
              isFavorite: true,
            ),
          ],
        );
      });

      test(
          'should return ${Left<Failure, List<Pokemon>>} when '
          '$FetchPokedexUseCase throw exception', () async {
        mockedFetchPokedexUseCase.mockLeftCall(const Failure(1));

        final result = await fetchFavouritePokemonsUseCase('');

        expect(result.isLeft(), true);
        expect(result.asLeft(), const Failure(ERROR_SERVER_ID));
      });
    });
  });
}
