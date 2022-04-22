import 'package:flutter_test/flutter_test.dart';
import 'package:guess_pokemon/src/domain/random_number_generator_usecase.dart';

void main() {
  group(RandomNumberGeneratorUseCase, () {
    late RandomNumberGeneratorUseCase randomNumberGeneratorUseCase;

    setUp(() {
      randomNumberGeneratorUseCase = RandomNumberGeneratorUseCase();
    });

    group('call', () {
      test('should return index between start and end ', () {
        const end = 5;
        const start = 0;
        final result = randomNumberGeneratorUseCase.call(
          start: start,
          end: end,
        );

        expect(result <= end, isTrue);
        expect(result >= start, isTrue);
      });
    });
  });
}
