enum BuildEnvironment { debug, qa, prod }

enum BuildFlavor { kanto, jhoto }

class BuildConfig {
  final BuildEnvironment buildEnvironment;
  final BuildFlavor buildFlavor;

  BuildConfig({
    required this.buildEnvironment,
    required this.buildFlavor,
  });
}
