import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:guess_pokemon/guess_pokemon.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokemon_quiz/di/locator.dart';
import 'package:pokemon_quiz/feature/splash_page/widget/splash_mobile_widget.dart';
import 'package:pokemon_quiz/feature/splash_page/widget/splash_tablet_widget.dart';
import 'package:setting/setting.dart';
import 'package:ui_core/ui_core.dart';
import 'package:pokemon_detail/pokemon_detail.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late bool _isInitialized;

  @override
  void initState() {
    _isInitialized = false;
    _setupLocator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveContainerWidget(
        mobileBuilder: (_) => SplashMobileWidget(isInitialized: _isInitialized),
        tabletBuilder: (_) => SplashTabletWidget(isInitialized: _isInitialized),
        desktopBuilder: (_) => SplashTabletWidget(
          isInitialized: _isInitialized,
        ),
      ),
    );
  }

  Future<void> _setupLocator() async {
    await setupDomainModule(getIt);
    setupUiCoreModule(getIt);
    setupPokedexFeature(getIt);
    setupGuessPokemonFeature(getIt);
    setupPokemonDetailFeature(getIt);
    setupSettingFeature(getIt);
    setState(() {
      _isInitialized = true;
    });
  }
}
