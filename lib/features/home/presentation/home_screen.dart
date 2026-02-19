import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Prove.'),
              Spacer(),
              Text('Une longue phrase qui fait gagner du temps.'),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
