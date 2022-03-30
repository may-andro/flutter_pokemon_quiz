/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsGifGen {
  const $AssetsGifGen();

  /// File path: assets/gif/pokemon.gif
  AssetGenImage get pokemon => const AssetGenImage('assets/gif/pokemon.gif');
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/badge_pokemon.png
  AssetGenImage get badgePokemon =>
      const AssetGenImage('assets/images/badge_pokemon.png');

  /// File path: assets/images/pokemon_logo.png
  AssetGenImage get pokemonLogo =>
      const AssetGenImage('assets/images/pokemon_logo.png');

  /// File path: assets/images/type_bug.png
  AssetGenImage get typeBug =>
      const AssetGenImage('assets/images/type_bug.png');

  /// File path: assets/images/type_dark.png
  AssetGenImage get typeDark =>
      const AssetGenImage('assets/images/type_dark.png');

  /// File path: assets/images/type_dragon.png
  AssetGenImage get typeDragon =>
      const AssetGenImage('assets/images/type_dragon.png');

  /// File path: assets/images/type_electric.png
  AssetGenImage get typeElectric =>
      const AssetGenImage('assets/images/type_electric.png');

  /// File path: assets/images/type_fairy.png
  AssetGenImage get typeFairy =>
      const AssetGenImage('assets/images/type_fairy.png');

  /// File path: assets/images/type_fighting.png
  AssetGenImage get typeFighting =>
      const AssetGenImage('assets/images/type_fighting.png');

  /// File path: assets/images/type_fire.png
  AssetGenImage get typeFire =>
      const AssetGenImage('assets/images/type_fire.png');

  /// File path: assets/images/type_flying.png
  AssetGenImage get typeFlying =>
      const AssetGenImage('assets/images/type_flying.png');

  /// File path: assets/images/type_ghost.png
  AssetGenImage get typeGhost =>
      const AssetGenImage('assets/images/type_ghost.png');

  /// File path: assets/images/type_grass.png
  AssetGenImage get typeGrass =>
      const AssetGenImage('assets/images/type_grass.png');

  /// File path: assets/images/type_ground.png
  AssetGenImage get typeGround =>
      const AssetGenImage('assets/images/type_ground.png');

  /// File path: assets/images/type_ice.png
  AssetGenImage get typeIce =>
      const AssetGenImage('assets/images/type_ice.png');

  /// File path: assets/images/type_normal.png
  AssetGenImage get typeNormal =>
      const AssetGenImage('assets/images/type_normal.png');

  /// File path: assets/images/type_poison.png
  AssetGenImage get typePoison =>
      const AssetGenImage('assets/images/type_poison.png');

  /// File path: assets/images/type_psychic.png
  AssetGenImage get typePsychic =>
      const AssetGenImage('assets/images/type_psychic.png');

  /// File path: assets/images/type_rock.png
  AssetGenImage get typeRock =>
      const AssetGenImage('assets/images/type_rock.png');

  /// File path: assets/images/type_steel.png
  AssetGenImage get typeSteel =>
      const AssetGenImage('assets/images/type_steel.png');

  /// File path: assets/images/type_water.png
  AssetGenImage get typeWater =>
      const AssetGenImage('assets/images/type_water.png');

  /// File path: assets/images/warning.png
  AssetGenImage get warning => const AssetGenImage('assets/images/warning.png');
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/pokeball.json
  String get pokeball => 'assets/lottie/pokeball.json';

  /// File path: assets/lottie/pokemon.json
  String get pokemon => 'assets/lottie/pokemon.json';
}

class Assets {
  Assets._();

  static const $AssetsGifGen gif = $AssetsGifGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
