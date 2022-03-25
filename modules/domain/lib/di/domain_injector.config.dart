// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:data/data.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../mapper/mapper.dart' as _i5;
import '../mapper/pokedex/pokedex_remote_mapper.dart' as _i13;
import '../mapper/pokemon/favourite_pokemon_local_mapper.dart' as _i6;
import '../mapper/pokemon/pokemon_local_mapper.dart' as _i9;
import '../mapper/pokemon/pokemon_remote_mapper.dart' as _i12;
import '../mapper/pokemon/pokemon_stats_remote_mapper.dart' as _i10;
import '../usecase/pokedex/fetch_pokedex_usecase.dart' as _i8;
import '../usecase/pokemon/add_favourite_pokemon_usecase.dart' as _i3;
import '../usecase/pokemon/fetch_favourite_pokemons_usecase.dart' as _i7;
import '../usecase/pokemon/remove_favourite_pokemon_usecase.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initDomainGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AddFavouritePokemonUseCase>(() =>
      _i3.AddFavouritePokemonUseCase(
          get<_i4.PokemonRepository>(), get<_i5.PokemonLocalMapper>()));
  gh.factory<_i6.FavouritePokemonLocalMapper>(
      () => _i6.FavouritePokemonLocalMapper());
  gh.factory<_i7.FetchFavouritePokemonsUseCase>(() =>
      _i7.FetchFavouritePokemonsUseCase(get<_i4.PokemonRepository>(),
          get<_i5.FavouritePokemonLocalMapper>()));
  gh.factory<_i8.FetchPokedexUseCase>(() => _i8.FetchPokedexUseCase(
      get<_i4.PokedexRepository>(), get<_i5.PokedexRemoteMapper>()));
  gh.factory<_i9.PokemonLocalMapper>(() => _i9.PokemonLocalMapper());
  gh.factory<_i10.PokemonStatsRemoteMapper>(
      () => _i10.PokemonStatsRemoteMapper());
  gh.factory<_i11.RemoveFavouritePokemonUseCase>(
      () => _i11.RemoveFavouritePokemonUseCase(get<_i4.PokemonRepository>()));
  gh.factory<_i12.PokemonRemoteMapper>(
      () => _i12.PokemonRemoteMapper(get<_i10.PokemonStatsRemoteMapper>()));
  gh.factory<_i13.PokedexRemoteMapper>(
      () => _i13.PokedexRemoteMapper(get<_i12.PokemonRemoteMapper>()));
  return get;
}
