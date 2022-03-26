import 'package:pokemon_quiz/flavor/run_flavor.dart';
import 'package:ui_core/ui_core.dart';

final _buildConfig = BuildConfig(
  buildEnvironment: BuildEnvironment.prod,
  buildFlavor: BuildFlavor.kanto,
);

void main() {
  runFlavor(_buildConfig);
}
