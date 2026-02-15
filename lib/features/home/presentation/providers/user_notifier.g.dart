// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserNotifier)
const userProvider = UserNotifierProvider._();

final class UserNotifierProvider
    extends $AsyncNotifierProvider<UserNotifier, UserDto?> {
  const UserNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userNotifierHash();

  @$internal
  @override
  UserNotifier create() => UserNotifier();
}

String _$userNotifierHash() => r'616fdecc569b2125e0445cc02e4bfab037509030';

abstract class _$UserNotifier extends $AsyncNotifier<UserDto?> {
  FutureOr<UserDto?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<UserDto?>, UserDto?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<UserDto?>, UserDto?>,
        AsyncValue<UserDto?>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
