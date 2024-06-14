import 'package:flutter/material.dart';
import 'package:flutter_starter/generated/l10n.dart';
import 'package:flutter_starter/values/colors.dart';
import 'package:flutter_starter/values/styles.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<void> openUrl(BuildContext context, String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.blackTwo,
        content: Text(
          S.of(context).errorCannotOpenWebsite,
          style: AppTextStyles.errorLabel.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

