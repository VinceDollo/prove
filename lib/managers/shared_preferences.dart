import 'dart:async';
import 'dart:convert';

import 'package:flutter_starter/model/api/response/bearer_token.dart';
import 'package:flutter_starter/values/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// BEARER TOKEN
Future<void> saveBearerToken(BearerToken bearerToken) {
  final user = jsonEncode(bearerToken.toJson());
  return AppSharedPreferences.save<String>(AppConstants.bearerToken, user);
}

Future<BearerToken?> loadBearerToken() async {
  return AppSharedPreferences.load<String>(AppConstants.bearerToken).then((jsonString) {
    if (jsonString == null) return null;

    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
    return BearerToken.fromJson(jsonMap);
  });
}

Future<void> cleanBearerToken() => AppSharedPreferences.save<String>(AppConstants.bearerToken, null);

class AppSharedPreferences {
  static Future<void> save<T>(String key, T? value) async {
    final prefs = await SharedPreferences.getInstance();

    if (value == null) {
      await prefs.remove(key);
      return;
    }

    if (value is String) {
      await prefs.setString(key, value);
      return;
    }

    if (value is int) {
      await prefs.setInt(key, value);
      return;
    }

    if (value is double) {
      await prefs.setDouble(key, value);
      return;
    }

    if (value is bool) {
      await prefs.setBool(key, value);
      return;
    }

    if (value is List<String>) {
      await prefs.setStringList(key, value);
      return;
    }

    throw Exception(
      'Cannot save the shared value $value, unknown type ${value.runtimeType}',
    );
  }

  /// Load a value from SharedPreferences
  static Future<T?> load<T>(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final dynamic value = prefs.get(key);

    if (value is T) return value;
    return null;
  }
}
