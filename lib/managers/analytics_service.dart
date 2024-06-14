import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  Future<dynamic> signUp() async {
    await _analytics.logEvent(name: 'sign_up');
  }

  Future<dynamic> signIn() async {
    await _analytics.logEvent(name: 'sign_in');
  }

  // TODO Set the list of analytics custom events here
  Future<dynamic> oneCustomEvent() async {
    await _analytics.logEvent(name: 'custom_event');
  }
}
