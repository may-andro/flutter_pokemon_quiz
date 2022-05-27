import 'package:domain/domain.dart';
import 'package:ui_core/ui_core.dart';

class PokedexViewModel extends BaseViewModel {
  PokedexViewModel(
    this._fetchPokedexUseCase,
    this._buildConfig,
  );

  final FetchPokedexUseCase _fetchPokedexUseCase;
  final BuildConfig _buildConfig;

  late List<Pokemon> _pokemons;
  late String _errorMessage;

  List<Pokemon> get pokemons => _pokemons;

  String get errorMessage => _errorMessage;

  Future<void> onInit() async {
    await _loadPokedex();
  }

  Future<void> _loadPokedex() async {
    final eitherPokemons = await _fetchPokedexUseCase.call(
      _buildConfig.buildFlavor.name,
    );

    if (eitherPokemons.isLeft()) {
      (eitherPokemons.asLeft() as FetchPokedexUseCaseFailure).when(
          parse: (error, stackTrace) {
        _errorMessage = 'Failed to fetch pokedex due to parsing error';
      }, server: (error, stackTrace) {
        _errorMessage = 'Failed to fetch pokedex due to server error';
      });
      setErrorState();
    }

    if (eitherPokemons.isRight()) {
      _pokemons = eitherPokemons.asRight();
      setSuccessState();
    }
  }
}
