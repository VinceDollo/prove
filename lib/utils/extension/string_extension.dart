import 'package:charcode/charcode.dart';

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String capitalizeWords() {
    if (isEmpty) return this;

    return split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }

  String? toPrice() {
    final intParse = int.tryParse(this);
    if (intParse != null) {
      return '$intParse${String.fromCharCode($nbsp)}€';
    }

    final value = double.tryParse(this);
    if (value != null) {
      final valueFloor = value.floorToDouble();
      if (value == valueFloor) {
        return '${value.floor()}${String.fromCharCode($nbsp)}€';
      } else {
        return '${value.toStringAsFixed(2)}${String.fromCharCode($nbsp)}€';
      }
    }

    return '$this${String.fromCharCode($nbsp)}€';
  }
}
