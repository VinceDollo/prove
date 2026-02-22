import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_starter/features/home/data/models/sentence_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SentenceLocalDatasource {
  static const _likedKey = 'liked_sentence_dates';

  Future<List<SentenceModel>> getSentences() async {
    final raw = await rootBundle.loadString('assets/data/sentences.json');
    final list = jsonDecode(raw) as List<dynamic>;
    return list.map((e) => SentenceModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<List<String>> getLikedDates() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_likedKey) ?? [];
  }

  Future<void> toggleLike(String dateStr) async {
    final prefs = await SharedPreferences.getInstance();
    final liked = prefs.getStringList(_likedKey) ?? [];
    if (liked.contains(dateStr)) {
      liked.remove(dateStr);
    } else {
      liked.add(dateStr);
    }
    await prefs.setStringList(_likedKey, liked);
  }
}
