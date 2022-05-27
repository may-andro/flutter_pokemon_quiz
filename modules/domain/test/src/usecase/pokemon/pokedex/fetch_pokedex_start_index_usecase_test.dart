import 'package:domain/src/model/model.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mock/model/mocked_build_config.dart';

void main() {
  group(FetchPokedexStartIndexUseCase, () {
    late MockedBuildConfig buildConfig;

    late FetchPokedexStartIndexUseCase fetchPokedexStartIndexUseCase;

    setUp(() {
      buildConfig = MockedBuildConfig();

      fetchPokedexStartIndexUseCase = FetchPokedexStartIndexUseCase(
        buildConfig,
      );
    });

    group('call', () {
      test('should return 152 when ${BuildFlavor.jhoto}', () {
        buildConfig.mockFlavor(BuildFlavor.jhoto);

        final result = fetchPokedexStartIndexUseCase();

        expect(result, 152);
      });

      test('should return 1 when ${BuildFlavor.kanto}', () {
        buildConfig.mockFlavor(BuildFlavor.kanto);

        final result = fetchPokedexStartIndexUseCase();

        expect(result, 1);
      });
    });
  });
}
