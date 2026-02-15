import 'package:flutter/material.dart';
import 'package:flutter_starter/core/app/app_flavor.dart';
import 'package:flutter_starter/core/utils/instance_get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionWidget extends StatelessWidget {
  const VersionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (_, AsyncSnapshot<PackageInfo> snapshot) {
        if (snapshot.hasData) {
          final version = snapshot.data?.version ?? '';
          final buildNumber = snapshot.data?.buildNumber ?? '';
          final flavorName = instanceGetIt<AppFlavor>().name;

          return Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Version : $version+$buildNumber $flavorName',
                style: const TextStyle(color: Colors.black38, fontSize: 10),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
