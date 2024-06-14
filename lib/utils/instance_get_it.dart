import 'package:flutter_starter/managers/analytics_service.dart';
import 'package:get_it/get_it.dart';

GetIt instanceGetIt = GetIt.instance;

void setupGetIt() {
  instanceGetIt.registerLazySingleton(AnalyticsService.new);
}
