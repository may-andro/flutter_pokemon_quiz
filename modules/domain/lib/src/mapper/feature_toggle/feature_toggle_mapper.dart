import 'package:domain/src/mapper/model_entity_mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:network/network.dart';

class FeatureToggleMapper
    implements ModelEntityMapper<Feature, RemoteConfigFeature> {
  @override
  Feature mapFromEntityToModel(RemoteConfigFeature entity) {
    switch (entity) {
      case RemoteConfigFeature.feature_toggle_developer_option:
        return Feature.developer_mode;
      case RemoteConfigFeature.feature_toggle_pokedex:
        return Feature.pokedex;
      case RemoteConfigFeature.feature_toggle_pokemon_detail:
        return Feature.pokemon_detail;
      case RemoteConfigFeature.feature_toggle_user_feedback:
        return Feature.user_feedback;
    }
  }

  @override
  RemoteConfigFeature mapFromModelToEntity(Feature model) {
    switch (model) {
      case Feature.developer_mode:
        return RemoteConfigFeature.feature_toggle_developer_option;
      case Feature.pokemon_detail:
        return RemoteConfigFeature.feature_toggle_pokemon_detail;
      case Feature.pokedex:
        return RemoteConfigFeature.feature_toggle_pokedex;
      case Feature.user_feedback:
        return RemoteConfigFeature.feature_toggle_user_feedback;
    }
  }
}
