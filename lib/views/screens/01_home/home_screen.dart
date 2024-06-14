import 'package:flutter/material.dart';
import 'package:flutter_starter/views/components/tap_to_close_keyboard.dart';
import 'package:flutter_starter/views/viewmodel/01_home/home_viewmodel.dart';

class Screen1 extends StatelessWidget {
  const Screen1(this._homeViewmodel, {Key? key}) : super(key: key);
  static const String routeName = 'screen1';

  final IHomeViewmodel _homeViewmodel;

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
