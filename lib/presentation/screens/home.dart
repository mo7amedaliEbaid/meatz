// lib/presentation/screens/category_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meatz/configs/configs.dart';
import 'package:meatz/core/core.dart';
import '../../application/application.dart';

import '../../di/locator.dart';
import '../../domain/domain.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: AppDimensions.normalize(25),
        title: Image.asset(
          AppAssets.logo,
          height: AppDimensions.normalize(15),
        ),
      ),
      body: BlocProvider(
        create: (context) => locator<CategoryBloc>()
          ..add(
            GetCategoriesEvent(),
          ),
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CategoryLoaded) {
              return ListView.builder(
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  return CategoryWidget(category: state.categories[index]);
                },
              );
            } else if (state is CategoryError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
// lib/presentation/widgets/category_widget.dart

class CategoryWidget extends StatelessWidget {
  final Category category;

  CategoryWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(category.image),
      title: Text(category.name),
      subtitle: Text('ID: ${category.id}'),
    );
  }
}
