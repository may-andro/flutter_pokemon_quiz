import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:network/src/entity/remote_config/remote_config_feature.dart';

class RemoteConfigClient {
  RemoteConfigClient(this._firebaseRemoteConfig);

  final FirebaseRemoteConfig _firebaseRemoteConfig;

  final Map<String, dynamic> _defaultConfig = {
    RemoteConfigFeature.feature_toggle_developer_option.name: false,
    RemoteConfigFeature.feature_toggle_pokedex.name: false,
    RemoteConfigFeature.feature_toggle_pokemon_detail.name: false,
    RemoteConfigFeature.feature_toggle_user_feedback.name: false,
  };

  Future<bool> initialise() async {
    await _firebaseRemoteConfig.setDefaults(_defaultConfig);
    try {
      await _firebaseRemoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: Duration.zero,
      ));
      await _firebaseRemoteConfig.fetch();
    } catch (exception) {
      // Handle error
    }
    return _firebaseRemoteConfig.activate();
  }

  bool getValue(RemoteConfigFeature remoteConfigFeature) {
    return _firebaseRemoteConfig.getBool(remoteConfigFeature.name);
  }
}
