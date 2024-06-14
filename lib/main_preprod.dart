import 'package:flutter_starter/app/app_flavor.dart';
import 'package:flutter_starter/main.dart';
import 'package:flutter_starter/utils/instance_get_it.dart';

void main() {
  instanceGetIt.registerSingleton<AppFlavor>(AppFlavor.preprod);
  commonMain();
}
