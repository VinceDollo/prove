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
    extends $AsyncNotifierProvider<AuthNotifier, BearerTokenDto?> {
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

String _$authNotifierHash() => r'ea59a0cdd97172536a35a38cc1d6f6c6bb629742';

abstract class _$AuthNotifier extends $AsyncNotifier<BearerTokenDto?> {
  FutureOr<BearerTokenDto?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<BearerTokenDto?>, BearerTokenDto?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<BearerTokenDto?>, BearerTokenDto?>,
        AsyncValue<BearerTokenDto?>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
