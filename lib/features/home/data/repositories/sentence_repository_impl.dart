import 'package:flutter_starter/data/model/result.dart';
import 'package:flutter_starter/features/home/data/datasources/sentence_local_datasource.dart';
import 'package:flutter_starter/features/home/domain/entities/sentence_entity.dart';
import 'package:flutter_starter/features/home/domain/repositories/sentence_repository.dart';

class SentenceNotFoundForTodayException implements Exception {}

class SentenceRepositoryImpl implements SentenceRepository {
  const SentenceRepositoryImpl(this._datasource);

  final SentenceLocalDatasource _datasource;

  @override
  Future<Result<SentenceEntity>> getSentenceOfDay() async {
    final sentences = await _datasource.getSentences();
    final likedDates = await _datasource.getLikedDates();
    final today = _formatDate(DateTime.now());
    final model = sentences.where((s) => s.date == today).firstOrNull;
    if (model == null) return Result.error(SentenceNotFoundForTodayException());
    return Result.success(
      SentenceEntity(
        sentence: model.sentence,
        date: DateTime.parse(model.date),
        isLiked: likedDates.contains(model.date),
      ),
    );
  }

  @override
  Future<Result<void>> toggleLike() async {
    try {
      await _datasource.toggleLike(_formatDate(DateTime.now()));
      return Result.success(null);
    } catch (e) {
      return Result.error(Exception());
    }
  }

  String _formatDate(DateTime date) => '${date.year.toString().padLeft(4, '0')}-'
      '${date.month.toString().padLeft(2, '0')}-'
      '${date.day.toString().padLeft(2, '0')}';
}
