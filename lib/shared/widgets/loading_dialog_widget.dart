import 'package:flutter/material.dart';
import 'package:flutter_starter/core/localization/generated/l10n.dart';
import 'package:flutter_starter/core/values/colors.dart';

class LoadingDialogWidget extends StatelessWidget {
  const LoadingDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.twilightBlue),
          ),
          const SizedBox(width: 16),
          Flexible(
            flex: 8,
            child: Text(
              S.of(context).loading,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
