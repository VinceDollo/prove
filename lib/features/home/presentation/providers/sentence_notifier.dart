import 'package:flutter_starter/core/utils/instance_get_it.dart';
import 'package:flutter_starter/features/home/domain/entities/sentence_entity.dart';
import 'package:flutter_starter/features/home/domain/usecases/get_sentence_of_day_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sentence_notifier.g.dart';

@riverpod
class SentenceNotifier extends _$SentenceNotifier {
  @override
  Future<SentenceEntity?> build() async {
    return fetchSentence();
  }

  late final GetSentenceOfDayUseCase? _getSentenceOfDay;

  Future<SentenceEntity?> fetchSentence() async {
    _getSentenceOfDay = instanceGetIt<GetSentenceOfDayUseCase>();
    final res = await _getSentenceOfDay!.call();
    if (res.isSuccess && res.data is SentenceEntity) {
      state = AsyncValue.data(res.data);
      return res.data!;
    }
    return null;
  }
}
