import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 100,
      height: 150,
      child: ColoredBox(
        color: Colors.grey,
        child: Icon(Icons.image, color: Colors.black38),
      ),
    );
  }
}
