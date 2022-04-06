import 'package:domain/domain.dart';
import 'package:pokedex/src/domain/fetch_pokemons_usecase.dart';
import 'package:ui_core/ui_core.dart';

class PokedexViewModel extends BaseViewModel {
  PokedexViewModel(
    this._fetchPokemonsUseCase,
  );

  final FetchPokemonsUseCase _fetchPokemonsUseCase;

  late Map<Pokemon, bool> _pokemons;
  late int _errorCode;

  Map<Pokemon, bool> get pokemonsMap => _pokemons;

  int get errorCode => _errorCode;

  Future<void> onInit() async {
    await _loadPokedex();
  }

  Future<void> _loadPokedex() async {
    try {
      _pokemons = await _fetchPokemonsUseCase.call();
      setSuccessState();
    } catch (e) {
      _errorCode = 1;
    }
  }
}
