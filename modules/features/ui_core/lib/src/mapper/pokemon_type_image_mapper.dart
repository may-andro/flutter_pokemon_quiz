import 'package:ui_core/assets/assets.gen.dart';

class PokemonTypeImageMapper {
  String map(String pokemonType) {
    switch (pokemonType) {
      case 'bug':
        return Assets.images.typeBug.path;
      case 'dark':
        return Assets.images.typeDark.path;
      case 'dragon':
        return Assets.images.typeDragon.path;
      case 'electric':
        return Assets.images.typeElectric.path;
      case 'fairy':
        return Assets.images.typeFairy.path;
      case 'fighting':
        return Assets.images.typeFighting.path;
      case 'fire':
        return Assets.images.typeFire.path;
      case 'flying':
        return Assets.images.typeFlying.path;
      case 'ghost':
        return Assets.images.typeGhost.path;
      case 'grass':
        return Assets.images.typeGrass.path;
      case 'ground':
        return Assets.images.typeGround.path;
      case 'ice':
        return Assets.images.typeIce.path;
      case 'normal':
        return Assets.images.typeNormal.path;
      case 'poison':
        return Assets.images.typePoison.path;
      case 'psychic':
        return Assets.images.typePsychic.path;
      case 'rock':
        return Assets.images.typeRock.path;
      case 'steel':
        return Assets.images.typeSteel.path;
      case 'water':
        return Assets.images.typeWater.path;
      default:
        return Assets.images.warning.path;
    }
  }
}
