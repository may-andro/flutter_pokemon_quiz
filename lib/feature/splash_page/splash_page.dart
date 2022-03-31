import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:guess_pokemon/guess_pokemon.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokemon_quiz/di/locator.dart';
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
        mobileBuilder: _buildMobile,
        tabletBuilder: _buildTablet,
        desktopBuilder: _buildDesktop,
      ),
    );
  }

  Widget _buildMobile(final BuildContext buildContext) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: context.getGridDimen(1)),
        _buildPokemonLogo(),
        SizedBox(height: context.getGridDimen(3)),
        _buildSplashImage(),
        const Spacer(),
        _buildGuessPokemonButton(context.shortestSide * 0.8),
        SizedBox(height: context.getGridDimen(2)),
        _buildSettingButton(context.shortestSide * 0.8),
        SizedBox(height: context.getGridDimen(2)),
      ],
    );
  }

  Widget _buildTablet(final BuildContext buildContext) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(child: _buildPokemonLogo()),
              _buildGuessPokemonButton(context.shortestSide * 0.8),
              SizedBox(height: context.getGridDimen(1)),
              _buildSettingButton(context.shortestSide * 0.8),
              SizedBox(height: context.getGridDimen(1)),
            ],
          ),
        ),
        _buildSplashImage(),
      ],
    );
  }

  Widget _buildDesktop(final BuildContext buildContext) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(child: _buildPokemonLogo()),
              _buildGuessPokemonButton(context.shortestSide * 0.8),
              SizedBox(height: context.getGridDimen(1)),
              _buildSettingButton(context.shortestSide * 0.8),
              SizedBox(height: context.getGridDimen(0.5)),
            ],
          ),
        ),
        _buildSplashImage(),
      ],
    );
  }

  Widget _buildPokemonLogo() {
    return PokemonLogoImageWidget(
      height: context.height * 0.25,
      width: context.width * 0.7,
    );
  }

  Widget _buildSplashImage() {
    return LottieLoadingWidget(
      height: context.shortestSide * 0.7,
      width: context.shortestSide * 0.7,
      asset: LottieAsset.pokemon,
    );
  }

  Widget _buildSettingButton(final double width) {
    return SizedBox(
      width: width,
      child: RoundedButton(
        label: _isInitialized ? 'Setting' : 'Loading',
        onPressed: _isInitialized
            ? () => Navigator.pushNamed(context, SettingRoute.root)
            : null,
      ),
    );
  }

  Widget _buildGuessPokemonButton(final double width) {
    return SizedBox(
      width: width,
      child: RoundedButton(
        label: _isInitialized ? "Who's that Pokemon" : 'Loading',
        onPressed: _isInitialized
            ? () => Navigator.pushNamed(context, GuessPokemonRoute.root)
            : null,
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
