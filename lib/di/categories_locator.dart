part of 'locator.dart';

void setupCategories() {
  locator.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(
      firestore: locator(),
    ),
  );

  locator.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<GetCategories>(
    () => GetCategories(
      locator(),
    ),
  );

  locator.registerFactory(
    () => CategoryBloc(
      getCategories: locator(),
    ),
  );
}
