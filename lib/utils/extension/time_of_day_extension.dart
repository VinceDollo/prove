import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TimeOfDayExtension on TimeOfDay {
  String toTimeString() {
    final now = DateTime.now();
    final toShow = DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
    return DateFormat.Hm(Intl.getCurrentLocale()).format(toShow);
  }
}
