import 'package:flutter_starter/data/model/result.dart';
import 'package:flutter_starter/features/home/domain/repositories/sentence_repository.dart';

class ToggleLikeUseCase {
  const ToggleLikeUseCase(this._repository);

  final SentenceRepository _repository;

  Future<Result<void>> toggleLike() => _repository.toggleLike();
}
