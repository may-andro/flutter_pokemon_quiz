import 'package:domain/domain.dart';
import 'package:ui_core/assets/assets.gen.dart';

const testPokemon = Pokemon(
  index: 1,
  name: 'name',
  baseExperience: 1,
  weight: 1,
  height: 1,
  imageUrl:
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/132.png',
  abilities: [],
  moves: [],
  types: [],
  stats: [PokemonStat(name: 'test', baseStat: 123, effort: 150)],
  isFavorite: true,
  isCaptured: false,
);

final pokemonImageTypeList = [
  Assets.images.typeElectric.path,
  Assets.images.typeWater.path
];
