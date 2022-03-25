// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:local/client/clients.dart' as _i10;
import 'package:network/network.dart' as _i5;

import '../data_source/pokedex/pokedex_data_source.dart' as _i3;
import '../data_source/pokedex/pokedex_data_source_impl.dart' as _i4;
import '../data_source/pokemon/pokemon_data_source.dart' as _i8;
import '../data_source/pokemon/pokemon_data_source_impl.dart' as _i9;
import '../repository/pokedex/pokedex_repository.dart' as _i6;
import '../repository/pokedex/pokedex_repository_impl.dart' as _i7;
import '../repository/pokemon/pokemon_repository.dart' as _i11;
import '../repository/pokemon/pokemon_repository_impl.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initDataGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.PokedexDataSource>(
      () => _i4.PokedexDataSourceImpl(get<_i5.FirebaseClient>()));
  gh.lazySingleton<_i6.PokedexRepository>(
      () => _i7.PokedexRepositoryImpl(get<_i3.PokedexDataSource>()));
  gh.lazySingleton<_i8.PokemonDataSource>(
      () => _i9.PokemonDataSourceImpl(get<_i10.PokemonLocalClient>()));
  gh.lazySingleton<_i11.PokemonRepository>(
      () => _i12.PokemonRepositoryImpl(get<_i8.PokemonDataSource>()));
  return get;
}
