import 'package:domain/src/model/model.dart';

class FetchPokedexEndIndexUseCase {
  FetchPokedexEndIndexUseCase(this._buildConfig);

  final BuildConfig _buildConfig;

  int call() {
    switch (_buildConfig.buildFlavor) {
      case BuildFlavor.kanto:
        return 151;
      case BuildFlavor.jhoto:
        return 251;
    }
  }
}
