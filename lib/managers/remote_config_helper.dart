import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_starter/model/remote_config/maintenance.dart';
import 'package:flutter_starter/model/remote_config/minimum_version.dart';
import 'package:flutter_starter/utils/app_logger.dart';
import 'package:flutter_starter/utils/instance_get_it.dart';
import 'package:flutter_starter/utils/json_decode_on_compute.dart';

final defaultsRemoteConfig = <String, dynamic>{
  minimumVersionJsonRemoteKey: jsonEncode(MinimumVersion.defaultMap),
  maintenanceJsonRemoteKey: jsonEncode(Maintenance.defaultMap),
};

class RemoteConfigNeeded {
  bool value = false;
}

Future<void> initialiseRemoteConfig() async {
  instanceGetIt.registerSingleton<RemoteConfigNeeded>(RemoteConfigNeeded());
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setDefaults(defaultsRemoteConfig);
  await remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval:
          kReleaseMode ? const Duration(minutes: 1) : Duration.zero,
    ),
  );
  try {
    await remoteConfig.fetchAndActivate().then(
          (value) => remoteConfig.check().then((value) => remoteConfig.check()),
        );
  } catch (e) {
    logger.e(e.toString());
  }
}

extension RemoteConfigExtension on FirebaseRemoteConfig {
  Future<MinimumVersion> get minimumVersion async {
    final jsonString = getString(minimumVersionJsonRemoteKey);
    final jsonMap = await compute(jsonDecodeOnCompute, jsonString);
    return MinimumVersion.fromJson(jsonMap);
  }

  Future<Maintenance> get maintenance async {
    final jsonString = getString(maintenanceJsonRemoteKey);
    final jsonMap = await compute(jsonDecodeOnCompute, jsonString);
    return Maintenance.fromJson(jsonMap);
  }

  Future<bool> check() async {
    final updateMandatory = await (await minimumVersion).updateMandatory();
    final maintenanceActive = (await maintenance).isActive;
    final result = maintenanceActive || updateMandatory;
    instanceGetIt<RemoteConfigNeeded>().value = result;
    return result;
  }
}
