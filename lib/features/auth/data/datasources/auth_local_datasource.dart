import 'dart:convert';

import 'package:flutter_starter/core/values/constants.dart';
import 'package:flutter_starter/features/auth/data/models/bearer_token_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  Future<void> saveBearerToken(BearerTokenDto bearerToken) async {
    final prefs = await SharedPreferences.getInstance();
    final json = jsonEncode(bearerToken.toJson());
    await prefs.setString(AppConstants.bearerToken, json);
  }

  Future<BearerTokenDto?> loadBearerToken() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(AppConstants.bearerToken);

    if (jsonString == null) return null;

    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
    return BearerTokenDto.fromJson(jsonMap);
  }

  Future<void> clearBearerToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.bearerToken);
  }
}
