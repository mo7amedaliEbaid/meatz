import 'package:get_it/get_it.dart';
import 'package:meatz/di/categories_locator.dart';
import 'auth_locator.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  setupAuth();
  setupCategories();
}
