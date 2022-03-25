import 'package:network/network.dart';

abstract class PokedexRepository {
  Future<RemotePokedex> fetchPokedex(String region);
}
