import 'package:flutter/material.dart';
import 'package:flutter_starter/shared/widgets/tap_to_close_keyboard.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);
  static const String routeName = 'screen1';

  @override
  Widget build(BuildContext context) {
    return TapToCloseKeyboard(
      child: Scaffold(
        appBar: AppBar(title: const Text('screen1')),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text('Hello'),
            ],
          ),
        ),
      ),
    );
  }
}
