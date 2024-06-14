import 'dart:async';
import 'dart:convert';

import 'package:flutter_starter/model/api/response/bearer_token_response.dart';
import 'package:flutter_starter/values/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// BEARER TOKEN
Future<void> saveBearerToken(BearerToken bearerToken) {
  final user = jsonEncode(bearerToken.toJson());
  return AppSharedPreferences.save<String>(AppConstants.bearerToken, user);
}

Future<BearerToken?> loadBearerToken() async {
  return AppSharedPreferences.load<String>(AppConstants.bearerToken)
      .then((jsonString) {
    if (jsonString == null) return null;

    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
    return BearerToken.fromJson(jsonMap);
  });
}

Future<void> cleanBearerToken() =>
    AppSharedPreferences.save<String>(AppConstants.bearerToken, null);

/// GENERIC
class AppSharedPreferences {
  /// Save some value in shared preferences
  static Future<void> save<T>(String key, T? value) async {
    final instance = await SharedPreferences.getInstance();

    if (value == null) {
      await instance.remove(key);
      return;
    }

    switch (T) {
      case String:
        await instance.setString(key, value as String);
        break;
      case int:
        await instance.setInt(key, value as int);
        break;
      case double:
        await instance.setDouble(key, value as double);
        break;
      case bool:
        await instance.setBool(key, value as bool);
        break;
      case List:
        await instance.setStringList(key, value as List<String>);
        break;
      default:
        throw Exception(
          'Cannot save the shared value $value, unknown type $T/${value.runtimeType}',
        );
    }
  }

  /// Get a value previously saved in shared preferences
  static Future<T?> load<T>(String key) async {
    final prefs = await SharedPreferences.getInstance();
    switch (T) {
      case String:
        return prefs.getString(key) as T?;
      case int:
        return prefs.getInt(key) as T?;
      case double:
        return prefs.getDouble(key) as T?;
      case bool:
        return prefs.getBool(key) as T?;
      case List:
        return prefs.getStringList(key) as T?;
      default:
        throw Exception(
          'Cannot load the value, unknown type',
        );
    }
  }
}
