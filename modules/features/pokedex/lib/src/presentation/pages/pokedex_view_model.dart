import 'package:domain/domain.dart';
import 'package:ui_core/ui_core.dart';

class PokedexViewModel extends BaseViewModel {
  PokedexViewModel(
    this._fetchPokedexUseCase,
    this._buildConfig,
  );

  final FetchPokedexUseCase _fetchPokedexUseCase;
  final BuildConfig _buildConfig;

  late Pokedex _pokedex;
  late int _errorCode;

  Pokedex get pokedex => _pokedex;

  int get errorCode => _errorCode;

  Future<void> onInit() async {
    await _loadPokedex();
  }

  Future<void> _loadPokedex() async {
    final pokedex = await _fetchPokedexUseCase.call(
      _buildConfig.buildFlavor.name,
    );

    if (pokedex.isLeft()) {
      _errorCode = pokedex.asLeft().errorId;
      setErrorState();
    }

    if (pokedex.isRight()) {
      _pokedex = pokedex.asRight();
      setSuccessState();
    }
  }
}
