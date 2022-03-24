// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:local/client/clients.dart' as _i8;
import 'package:network/network.dart' as _i5;

import '../data_source/pokedex/pokedex_data_source.dart' as _i3;
import '../data_source/pokedex/pokedex_data_source_impl.dart' as _i4;
import '../data_source/pokemon/pokemon_data_source.dart' as _i6;
import '../data_source/pokemon/pokemon_data_source_impl.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initDataGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.PokedexDataSource>(
      () => _i4.PokedexDataSourceImpl(get<_i5.FirebaseClient>()));
  gh.lazySingleton<_i6.PokemonDataSource>(
      () => _i7.PokemonDataSourceImpl(get<_i8.PokemonLocalClient>()));
  return get;
}
