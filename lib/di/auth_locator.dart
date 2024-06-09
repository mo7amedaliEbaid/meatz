import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../application/blocs/auth/auth_bloc.dart';
import '../data/data_sources/auth.dart';
import '../data/repositories/auth.dart';
import '../domain/repositories/auth.dart';
import '../domain/use_case/auth.dart';
import 'locator.dart';

void setupAuth() {
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  locator.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());

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
