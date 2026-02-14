import 'package:flutter/material.dart';
import 'package:flutter_starter/values/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    this.width = 19,
    this.height = 19,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: height,
        maxWidth: width,
      ),
      child: Center(
        child: SizedBox(
          height: height,
          width: width,
          child: const CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.lightGray),
          ),
        ),
      ),
    );
  }
}
