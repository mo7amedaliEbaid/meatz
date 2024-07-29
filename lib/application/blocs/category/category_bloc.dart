import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';

part 'category_event.dart';

part 'category_state.dart';

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
      emit(
        CategoryLoaded(categories: categories),
      );
    } catch (e) {
      emit(
        CategoryError(
          message: e.toString(),
        ),
      );
    }
  }
}
