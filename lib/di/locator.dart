import 'package:get_it/get_it.dart';
import 'auth_locator.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  setupAuth();
}
