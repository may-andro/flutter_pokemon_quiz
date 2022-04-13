import 'package:get_it/get_it.dart';
import 'package:ui_core/src/mapper/mapper.dart';

void setupUiCoreDependencies(final GetIt getIt) {
  getIt.registerLazySingleton(PokemonTypeImageMapper.new);
  getIt.registerLazySingleton(PokemonTypeColorMapper.new);
}
