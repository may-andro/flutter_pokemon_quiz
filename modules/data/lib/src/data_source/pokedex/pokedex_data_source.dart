import 'package:network/network.dart';

abstract class PokedexDataSource {
  Future<RemotePokedex> fetchPokedex(String region);
}
