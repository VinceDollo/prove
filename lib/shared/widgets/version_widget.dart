import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionWidget extends StatelessWidget {
  const VersionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (_, AsyncSnapshot<PackageInfo> snapshot) {
        if (snapshot.hasData) {
          final version = snapshot.data?.version ?? '';
          final buildNumber = snapshot.data?.buildNumber ?? '';
          return Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Version : $version+$buildNumber',
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
