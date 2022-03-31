import 'package:pokedex_builder/data/data_source/pokemon_data_source.dart';
import 'package:pokedex_builder/data/entity/remote_pokemon.dart';
import 'package:pokedex_builder/data/service/remote_client.dart';
import 'package:pokedex_builder/exceptions/parse_failure_exception.dart';

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
