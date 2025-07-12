import 'package:flutter/material.dart';
import 'package:flutter_starter/values/styles.dart';

void showSnackBar(
  BuildContext context,
  String message, {
  bool isError = true,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: AppTextStyles.h5.copyWith(
          color: Colors.white,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
      closeIconColor: Colors.white,
      backgroundColor: isError ? Colors.red : Colors.green,
    ),
  );
}
