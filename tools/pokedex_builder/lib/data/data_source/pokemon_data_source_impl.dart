import '../../exceptions/parse_failure_exception.dart';
import '../entity/remote_pokemon.dart';
import '../service/remote_client.dart';
import 'pokemon_data_source.dart';

class PokemonDataSourceImpl implements PokemonDataSource {
  PokemonDataSourceImpl(this._remoteClient);

  final RemoteClient _remoteClient;

  @override
  Future<RemotePokemon> fetchPokemon({required int index}) async {
    try {
      final response = await _remoteClient.getApiCall('pokemon/$index');
      return RemotePokemon.fromJson(response.data);
    } on TypeError catch (e) {
      throw ParsingException(e.stackTrace.toString());
    } catch (e) {
      rethrow;
    }
  }
}
