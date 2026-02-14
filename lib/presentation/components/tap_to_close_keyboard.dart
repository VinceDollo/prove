import 'package:flutter/material.dart';

class TapToCloseKeyboard extends StatelessWidget {
  const TapToCloseKeyboard({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: child,
    );
  }
}
