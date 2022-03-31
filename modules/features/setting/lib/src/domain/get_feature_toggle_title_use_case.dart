import 'package:domain/domain.dart';

class GetFeatureToggleTitleUseCase {
  String call(Feature feature) {
    switch (feature) {
      case Feature.user_feedback:
        return 'Feedback';
      case Feature.pokedex:
        return 'Pokedex';
      case Feature.pokemon_detail:
        return 'Pokemon Detail';
      case Feature.developer_mode:
        return 'Developer Option';
    }
  }
}
