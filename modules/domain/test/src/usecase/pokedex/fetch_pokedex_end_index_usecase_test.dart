import 'package:domain/src/model/model.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock/model/mocked_build_config.dart';

void main() {
  group(FetchPokedexEndIndexUseCase, () {
    late MockedBuildConfig mockedBuildConfig;

    late FetchPokedexEndIndexUseCase fetchPokedexEndIndexUseCase;

    setUp(() {
      mockedBuildConfig = MockedBuildConfig();

      fetchPokedexEndIndexUseCase = FetchPokedexEndIndexUseCase(
        mockedBuildConfig,
      );
    });

    group('call', () {
      test('should return 251 when ${BuildFlavor.jhoto}', () {
        mockedBuildConfig.mockFlavor(BuildFlavor.jhoto);

        final result = fetchPokedexEndIndexUseCase();

        expect(result, 251);
      });

      test('should return 151 when ${BuildFlavor.kanto}', () {
        mockedBuildConfig.mockFlavor(BuildFlavor.kanto);

        final result = fetchPokedexEndIndexUseCase();

        expect(result, 151);
      });
    });
  });
}
