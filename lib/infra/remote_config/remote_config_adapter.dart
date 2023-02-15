import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../data/data.dart';

class RemoteConfigAdapter implements AppRemoteConfig {
  @override
  Future<dynamic> fetchValue({
    required String key,
    required dynamic defaultValue,
  }) async {
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: Duration.zero,
          minimumFetchInterval: Duration.zero,
        ),
      );
      await remoteConfig.fetchAndActivate();
      return getValue(
        remoteConfig: remoteConfig,
        key: key,
        defaultValue: defaultValue,
      );
    } catch (_) {
      return null;
    }
  }

  dynamic getValue({
    required FirebaseRemoteConfig remoteConfig,
    required String key,
    required dynamic defaultValue,
  }) {
    switch (defaultValue.runtimeType) {
      case String:
        var value = remoteConfig.getString(key);
        return value != '' ? value : defaultValue;
      case int:
        var value = remoteConfig.getInt(key);
        return value != 0 ? value : defaultValue;
      case bool:
        var value = remoteConfig.getBool(key);
        return value;
      case double:
        var value = remoteConfig.getDouble(key);
        return value != 0.0 ? value : defaultValue;
      default:
        return Exception('Implementation not found');
    }
  }
}
