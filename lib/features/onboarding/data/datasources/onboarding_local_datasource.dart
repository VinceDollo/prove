import 'package:flutter_starter/data/datasources/local/shared_preferences.dart';

class OnboardingLocalDatasource {
  static const _key = 'onboarding_complete';

  Future<bool> isComplete() async =>
      await AppSharedPreferences.load<bool>(_key) ?? false;

  Future<void> markComplete() =>
      AppSharedPreferences.save<bool>(_key, true);
}
