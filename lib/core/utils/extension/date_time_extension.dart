import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime{


  /// Format date form DateTime to Local date string
  /// see https://api.flutter.dev/flutter/intl/DateFormat-class.html
  /// for example with locale :
  /// (en) 12/31/2020
  /// (fr) 31/12/2020
  String toDateString() => DateFormat.yMd(Intl.getCurrentLocale()).format(this);

  /// Format date form DateTime to Local date and time string
  /// see https://api.flutter.dev/flutter/intl/DateFormat-class.html
  /// for example with locale :
  /// (en) 12/31/2020 5:08 PM
  /// (fr) 31/12/2020 17:08
  String toDateTimeString() =>
      DateFormat.yMd(Intl.getCurrentLocale()).add_jm().format(this);

}
