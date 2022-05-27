import 'package:domain/src/model/model.dart';

class FetchPokedexStartIndexUseCase {
  FetchPokedexStartIndexUseCase(this._buildConfig);

  final BuildConfig _buildConfig;

  int call() {
    switch (_buildConfig.buildFlavor) {
      case BuildFlavor.kanto:
        return 1;
      case BuildFlavor.jhoto:
        return 152;
    }
  }
}
