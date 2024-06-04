// lib/presentation/blocs/category_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/category.dart';
import '../../../domain/use_case/category.dart';


class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategories getCategories;

  CategoryBloc({required this.getCategories}) : super(CategoryInitial()) {
    on<GetCategoriesEvent>(_onGetCategoriesEvent);
  }

  Future<void> _onGetCategoriesEvent(
      GetCategoriesEvent event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      final categories = await getCategories();
      emit(CategoryLoaded(categories: categories));
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }
}

// lib/presentation/blocs/category_event.dart

abstract class CategoryEvent {}

class GetCategoriesEvent extends CategoryEvent {}

// lib/presentation/blocs/category_state.dart

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;

  CategoryLoaded({required this.categories});
}

class CategoryError extends CategoryState {
  final String message;

  CategoryError({required this.message});
}
