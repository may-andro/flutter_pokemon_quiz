import 'package:network/entity/entity.dart';

abstract class PokedexDataSource{
  Future<RemotePokedex> fetchPokedex(String region);
}