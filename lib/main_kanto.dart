import 'package:pokemon_quiz/flavor/run_flavor.dart';
import 'package:pokemon_quiz/model/build_config.dart';

final _buildConfig = BuildConfig(
  buildEnvironment: BuildEnvironment.prod,
  buildFlavor: BuildFlavor.kanto,
);

void main() {
  runFlavor(_buildConfig);
}