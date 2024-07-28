part of 'locator.dart';

void setUpAbout() {
  locator.registerLazySingleton<AboutRemoteDataSource>(
    () => AboutRemoteDataSourceImpl(
      firestore: locator(),
    ),
  );
  locator.registerLazySingleton<AboutRepository>(
    () => AboutRepositoryImpl(
      aboutRemoteDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<GetAbout>(
    // locator(),
    () => GetAbout(
      aboutRepository: locator(),
    ),
  );

  locator.registerFactory(
    () => AboutBloc(
      getAbout: locator(),
    ),
  );
}
