import 'package:equatable/equatable.dart';
import 'package:qodera_task/features/categories/data/models/category_model.dart';

abstract class CategoriesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<CategoryModel> categories;
  CategoriesLoaded(this.categories);
  @override
  List<Object?> get props => [categories];
}

class CategoriesError extends CategoriesState {
  final String message;
  CategoriesError(this.message);
  @override
  List<Object?> get props => [message];
}
