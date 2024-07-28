import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../application/application.dart';
import '../data/data_sources/data_sources.dart';
import '../data/repositories/repositories.dart';
import '../domain/repositories/repositories.dart';
import '../domain/use_case/usecases.dart';

part 'about_locator.dart';

part 'auth_locator.dart';

part 'categories_locator.dart';

part 'dependencies_locator.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  setUpDependencies();
  setupAuth();
  setupCategories();
  setUpAbout();
}
