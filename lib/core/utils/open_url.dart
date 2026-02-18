import 'package:flutter/material.dart';
import 'package:flutter_starter/core/localization/generated/l10n.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<void> openUrl(BuildContext context, String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            S.of(context).errorCannotOpenWebsite,
          ),
        ),
      );
    }
  }
}
