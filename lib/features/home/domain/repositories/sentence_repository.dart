import 'package:flutter_starter/data/model/result.dart';
import 'package:flutter_starter/features/home/domain/entities/sentence_entity.dart';

abstract interface class SentenceRepository {
  Future<Result<SentenceEntity>> getSentenceOfDay();
  Future<Result<void>> toggleLike();
}
