

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/error/failures.dart';
import '../../../domain/categories/category_entity.dart';
import '../../../infrastructure/category/category_repo.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ICategoryRepository _categoryRepository;

  CategoryBloc(this._categoryRepository) : super(CategoryInitial()) {
    on<GetCategories>(_onGetCategories);
  }

  Future<void> _onGetCategories(
      GetCategories event,
      Emitter<CategoryState> emit,
      ) async {
    emit(CategoryLoading());
    final failureOrCategories = await _categoryRepository.getCategories();
    failureOrCategories.fold(
          (failure) => emit(CategoryError(_mapFailureToMessage(failure))),
          (categories) => emit(CategoryLoaded(categories)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return 'Server Error';
    } else {
      return 'Unexpected Error';
    }
  }
}


abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;

  const CategoryLoaded(this.categories);

  @override
  List<Object> get props => [categories];
}

class CategoryError extends CategoryState {
  final String message;

  const CategoryError(this.message);

  @override
  List<Object> get props => [message];
}


abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class GetCategories extends CategoryEvent {}

