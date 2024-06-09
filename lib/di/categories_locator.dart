import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meatz/application/blocs/category/category.dart';
import 'package:meatz/domain/use_case/category.dart';

import '../data/data_sources/category.dart';
import '../data/repositories/category.dart';
import '../domain/repositories/category.dart';
import 'locator.dart';

void setupCategories() {
  locator.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
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
    locator(),
  );

  locator.registerFactory(
    () => CategoryBloc(
      getCategories: locator(),
    ),
  );
}
