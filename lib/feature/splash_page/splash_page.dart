import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:guess_pokemon/guess_pokemon.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokemon_quiz/di/locator.dart';
import 'package:ui_core/ui_core.dart';
import 'package:pokemon_detail/pokemon_detail.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
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
        PokemonLogoImageWidget(
          height: context.height * 0.25,
          width: context.width * 0.7,
        ),
        SizedBox(height: context.getGridDimen(3)),
        LottieLoadingWidget(
          height: context.shortestSide * 0.7,
          width: context.shortestSide * 0.7,
          asset: LottieAsset.pokemon,
        ),
        const Spacer(),
        _buildGuessPokemonButton(context.shortestSide * 0.8),
        SizedBox(height: context.getGridDimen(2)),
        _buildPokedexButton(context.shortestSide * 0.8),
        SizedBox(height: context.getGridDimen(3)),
        Text(
          'Loading pokemons ...',
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorPalette.grey80,
          ),
        ),
        SizedBox(height: context.getGridDimen(0.5)),
        const LinearProgressIndicator(),
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
              Expanded(
                child: PokemonLogoImageWidget(
                  height: context.height * 0.25,
                  width: context.width * 0.7,
                ),
              ),
              _buildGuessPokemonButton(context.shortestSide * 0.8),
              SizedBox(height: context.getGridDimen(1)),
              _buildPokedexButton(context.shortestSide * 0.8),
              SizedBox(height: context.getGridDimen(3)),
              Text(
                'Loading pokemons ...',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorPalette.grey80,
                ),
              ),
              SizedBox(height: context.getGridDimen(0.5)),
              const LinearProgressIndicator(),
              SizedBox(height: context.getGridDimen(1)),
            ],
          ),
        ),
        LottieLoadingWidget(
          height: context.shortestSide * 0.7,
          width: context.shortestSide * 0.7,
          asset: LottieAsset.pokemon,
        ),
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
              Expanded(
                child: PokemonLogoImageWidget(
                  height: context.height * 0.25,
                  width: context.width * 0.7,
                ),
              ),
              _buildGuessPokemonButton(context.shortestSide * 0.8),
              SizedBox(height: context.getGridDimen(1)),
              _buildPokedexButton(context.shortestSide * 0.8),
              SizedBox(height: context.getGridDimen(3)),
              Text(
                'Loading pokemons ...',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorPalette.grey80,
                ),
              ),
              SizedBox(height: context.getGridDimen(1)),
              const LinearProgressIndicator(),
              SizedBox(height: context.getGridDimen(0.5)),
            ],
          ),
        ),
        LottieLoadingWidget(
          height: context.shortestSide * 0.7,
          width: context.shortestSide * 0.7,
          asset: LottieAsset.pokemon,
        ),
      ],
    );
  }

  Widget _buildPokedexButton(
    final double width,
  ) {
    return SizedBox(
      width: width,
      child: RoundedButton(
        label: 'Pokedex',
        onPressed: () {
          Navigator.pushNamed(context, ROUTE_POKEDEX);
        },
      ),
    );
  }

  Widget _buildGuessPokemonButton(
    final double width,
  ) {
    return SizedBox(
      width: width,
      child: RoundedButton(
        label: 'Guess Pokemon',
        onPressed: () {
          Navigator.pushNamed(context, ROUTE_GUESS_POKEMON);
        },
      ),
    );
  }

  Future<void> _setupLocator() async {
    await setupDomainModule(getIt);
    setupUiCoreModule(getIt);
    setupPokedexFeature(getIt);
    setupGuessPokemonFeature(getIt);
    setupPokemonDetailFeature(getIt);
  }
}
