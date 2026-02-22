import 'package:flutter_starter/core/utils/instance_get_it.dart';
import 'package:flutter_starter/features/home/domain/usecases/toggle_like_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'like_notifier.g.dart';

sealed class LikeState {}

class LikeStateInitial extends LikeState {}

class LikeStateSuccess extends LikeState {}

class LikeStateError extends LikeState {}

@riverpod
class LikeNotifier extends _$LikeNotifier {
  @override
  LikeState build() {
    _toggleLikeUseCase = instanceGetIt<ToggleLikeUseCase>();
    return LikeStateInitial();
  }

  late final ToggleLikeUseCase _toggleLikeUseCase;

  Future<void> toggleLike() async {
    await Future<void>.delayed(const Duration(seconds: 3));
    final res = await _toggleLikeUseCase.toggleLike();
    if (!res.isSuccess) {
      state = LikeStateError();
      return;
    }
    state = LikeStateSuccess();
  }
}
