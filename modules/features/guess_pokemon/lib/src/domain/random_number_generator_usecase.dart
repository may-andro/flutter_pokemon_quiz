import 'dart:math';

class RandomNumberGeneratorUseCase {
  RandomNumberGeneratorUseCase();

  int call({required final int start, required final int end}) {
    return start + Random().nextInt(end - start);
  }
}
