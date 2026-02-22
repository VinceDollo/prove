// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LikeNotifier)
const likeProvider = LikeNotifierProvider._();

final class LikeNotifierProvider
    extends $NotifierProvider<LikeNotifier, LikeState> {
  const LikeNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'likeProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$likeNotifierHash();

  @$internal
  @override
  LikeNotifier create() => LikeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LikeState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LikeState>(value),
    );
  }
}

String _$likeNotifierHash() => r'5669020bf1f83c4a1724f34f8eb16547bf8fa7f8';

abstract class _$LikeNotifier extends $Notifier<LikeState> {
  LikeState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LikeState, LikeState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<LikeState, LikeState>, LikeState, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
