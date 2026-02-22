import 'package:flutter_starter/data/model/result.dart';
import 'package:flutter_starter/features/home/domain/entities/sentence_entity.dart';
import 'package:flutter_starter/features/home/domain/repositories/sentence_repository.dart';

class GetSentenceOfDayUseCase {
  const GetSentenceOfDayUseCase(this._repository);

  final SentenceRepository _repository;

  Future<Result<SentenceEntity>> call() => _repository.getSentenceOfDay();
}
