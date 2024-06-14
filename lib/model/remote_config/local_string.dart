import 'package:intl/intl.dart';

class LocalString {
  LocalString({this.localizedString});

  LocalString.fromJson(Map<String, dynamic> json) {
    final languageCode = Intl.getCurrentLocale();

    localizedString = json.containsKey(languageCode)
        ? json[languageCode] as String?
        : json['all'] as String?;
  }

  String? localizedString;
}
