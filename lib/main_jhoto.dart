import 'package:domain/domain.dart';
import 'package:pokemon_quiz/flavor/run_flavor.dart';

final _buildConfig = BuildConfig(
  buildEnvironment: BuildEnvironment.prod,
  buildFlavor: BuildFlavor.jhoto,
);

void main() {
  runFlavor(_buildConfig);
}
