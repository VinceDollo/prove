import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

Future<String> customUserAgent() async {
  final packageInfo = await PackageInfo.fromPlatform();
  final deviceInfo = DeviceInfoPlugin();

  var deviceDescription = '';

  if (Platform.isAndroid) {
    final androidInfo = await deviceInfo.androidInfo;
    deviceDescription = 'Android ${androidInfo.version.sdkInt}';
    if (androidInfo.isPhysicalDevice) {
      deviceDescription += '; ${androidInfo.model}';
    } else {
      deviceDescription += '; emulator/${androidInfo.model}';
    }
  } else if (Platform.isIOS) {
    final iosInfo = await deviceInfo.iosInfo;
    deviceDescription = 'iOS ${iosInfo.systemVersion}';
    if (iosInfo.isPhysicalDevice) {
      deviceDescription += '; ${iosInfo.localizedModel}';
    } else {
      deviceDescription += '; simulator/${iosInfo.localizedModel}';
    }
  }

  return 'app/${packageInfo.version}/${packageInfo.buildNumber} '
      '($deviceDescription; ${Platform.localeName}) '
      '${packageInfo.appName}/${packageInfo.packageName}/'
      '${kReleaseMode ? 'release' : 'debug'} '
      '(Dart)';
}
