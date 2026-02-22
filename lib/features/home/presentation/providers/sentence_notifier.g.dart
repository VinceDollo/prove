// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sentence_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SentenceNotifier)
const sentenceProvider = SentenceNotifierProvider._();

final class SentenceNotifierProvider
    extends $AsyncNotifierProvider<SentenceNotifier, SentenceEntity?> {
  const SentenceNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'sentenceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sentenceNotifierHash();

  @$internal
  @override
  SentenceNotifier create() => SentenceNotifier();
}

String _$sentenceNotifierHash() => r'9dc419d22ed60d83b8f9d1d3b8aa127223774f0d';

abstract class _$SentenceNotifier extends $AsyncNotifier<SentenceEntity?> {
  FutureOr<SentenceEntity?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<SentenceEntity?>, SentenceEntity?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<SentenceEntity?>, SentenceEntity?>,
        AsyncValue<SentenceEntity?>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
