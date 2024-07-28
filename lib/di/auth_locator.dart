part of 'locator.dart';

void setupAuth() {

  // Register data sources
  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(
      firebaseAuth: locator(),
      googleSignIn: locator(),
    ),
  );

  // Register repositories
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(locator()),
  );

  // Register use cases
  locator.registerLazySingleton(() => SignInWithEmailAndPassword(locator()));
  locator.registerLazySingleton(() => RegisterWithEmailAndPassword(locator()));
  locator.registerLazySingleton(() => SignInWithGoogle(locator()));
  locator.registerLazySingleton(() => SignOut(locator()));
  locator.registerLazySingleton(() => GetAuthStateChanges(locator()));

  // Register BLoC
  locator.registerFactory(
    () => AuthBloc(
      signInWithEmailAndPassword: locator(),
      registerWithEmailAndPassword: locator(),
      signInWithGoogle: locator(),
      signOut: locator(),
      getAuthStateChanges: locator(),
    ),
  );
}
