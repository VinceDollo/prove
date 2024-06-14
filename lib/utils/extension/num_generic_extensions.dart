import 'package:intl/intl.dart';

extension NumGenericExtensions<T extends num> on T {
  String? toDateString({bool isSeconds = true}) {
    final format = DateFormat.yMd(Intl.getCurrentLocale());

    var coefficient = 1;
    if (isSeconds) {
      coefficient = 1000;
    }

    if (this is int) {
      final date =
          DateTime.fromMillisecondsSinceEpoch((this as int) * coefficient);
      return format.format(date);
    }

    return null;
  }

  String? toDateAndTimeString({bool isSeconds = true}) {
    final format = DateFormat.yMd(Intl.getCurrentLocale()).add_Hm();

    var coefficient = 1;
    if (isSeconds) {
      coefficient = 1000;
    }
    if (this is int) {
      final date =
          DateTime.fromMillisecondsSinceEpoch((this as int) * coefficient);
      return format.format(date);
    }
    return null;
  }
}
