import 'package:domain/domain.dart';

class GetFeatureToggleDescriptionUseCase {
  String call(Feature feature) {
    switch (feature) {
      case Feature.user_feedback:
        return 'Controls the visibility of the user Feedback Button in the setting screen';
      case Feature.pokedex:
        return 'Controls the visibility of the Pokedex Page in the app';
      case Feature.pokemon_detail:
        return 'Controls the visibility of the Pokemon Detail Page in the app';
      case Feature.developer_mode:
        return 'Controls the visibility of the Developer Option Button in the setting screen';
    }
  }
}
