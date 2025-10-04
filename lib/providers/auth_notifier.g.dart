// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthNotifier)
const authProvider = AuthNotifierProvider._();

final class AuthNotifierProvider
    extends $AsyncNotifierProvider<AuthNotifier, BearerToken?> {
  const AuthNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'authProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$authNotifierHash();

  @$internal
  @override
  AuthNotifier create() => AuthNotifier();
}

String _$authNotifierHash() => r'6bb1830c9b9a783f1f06fefa01f0d58382659b0d';

abstract class _$AuthNotifier extends $AsyncNotifier<BearerToken?> {
  FutureOr<BearerToken?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<BearerToken?>, BearerToken?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<BearerToken?>, BearerToken?>,
        AsyncValue<BearerToken?>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
