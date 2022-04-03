import 'package:domain/src/model/model.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock/model/mocked_build_config.dart';

void main() {
  group(FetchPokedexStartIndexUseCase, () {
    late MockedBuildConfig mockedBuildConfig;

    late FetchPokedexStartIndexUseCase fetchPokedexStartIndexUseCase;

    setUp(() {
      mockedBuildConfig = MockedBuildConfig();

      fetchPokedexStartIndexUseCase = FetchPokedexStartIndexUseCase(
        mockedBuildConfig,
      );
    });

    group('call', () {
      test('should return 152 when ${BuildFlavor.jhoto}', () {
        mockedBuildConfig.mockFlavor(BuildFlavor.jhoto);

        final result = fetchPokedexStartIndexUseCase();

        expect(result, 152);
      });

      test('should return 1 when ${BuildFlavor.kanto}', () {
        mockedBuildConfig.mockFlavor(BuildFlavor.kanto);

        final result = fetchPokedexStartIndexUseCase();

        expect(result, 1);
      });
    });
  });
}
