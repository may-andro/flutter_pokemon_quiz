import 'package:dartz/dartz.dart';
import 'package:domain/src/model/model.dart';
import 'package:domain/src/repository/pokemon/pokemon_repository.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fake/repository/pokemon/fake_pokemon_repository.dart';
import '../../../mock/model/mocked_build_config.dart';

void main() {
  group(FetchPokedexUseCase, () {
    late PokemonRepository pokemonRepository;
    late MockedBuildConfig buildConfig;

    late FetchPokedexUseCase fetchPokedexUseCase;

    setUp(() {
      pokemonRepository = FakePokemonRepository();
      buildConfig = MockedBuildConfig();

      fetchPokedexUseCase = FetchPokedexUseCase(pokemonRepository, buildConfig);
    });

    group('call', () {
      test('should return $Right', () async {
        buildConfig.mockFlavor(BuildFlavor.kanto);

        final result = await fetchPokedexUseCase(buildConfig.buildFlavor.name);

        expect(result.isRight(), true);
      });

      test('should return $Left when there is exception', () async {
        final result = await fetchPokedexUseCase('');

        expect(result.isLeft(), true);
      });
    });
  });
}
