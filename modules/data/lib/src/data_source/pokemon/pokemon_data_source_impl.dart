import 'package:data/src/data_source/pokemon/pokemon_data_source.dart';
import 'package:data/src/exception/parse_failure_exception.dart';
import 'package:local/local.dart';
import 'package:local/objectbox.g.dart';
import 'package:network/network.dart';

class PokemonDataSourceImpl implements PokemonDataSource {
  PokemonDataSourceImpl(this._localClient, this._remoteClient);

  final LocalClient<LocalPokemon> _localClient;
  final RemoteClient _remoteClient;

  @override
  List<LocalPokemon> getPokemons() => _localClient.getAll();

  @override
  int putPokemon(LocalPokemon localPokemon) => _localClient.put(localPokemon);

  @override
  bool removePokemon(int id) => _localClient.remove(id);

  @override
  Future<RemoteExtendedPokemon> fetchPokemon(int index) async {
    try {
      final response = await _remoteClient.getApiCall('pokemon/$index');
      return RemoteExtendedPokemon.fromJson(response.data);
    } on TypeError catch (e) {
      throw ParsingException(e.stackTrace.toString());
    } catch (e) {
      rethrow;
    }
  }

  @override
  List<LocalPokemon> queryPokemon(Condition<LocalPokemon> condition) =>
      _localClient.query(condition);
}
