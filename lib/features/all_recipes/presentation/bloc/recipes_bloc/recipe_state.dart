import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/data/models/recipts_model.dart';

abstract class ReciptsState extends Equatable {
  final List<RecipeModel>? recipts;
  final DioException? error;

  const ReciptsState({this.recipts, this.error});

  @override
  List<Object?> get props => [recipts, error];
}

class ReciptsInitial extends ReciptsState {
  const ReciptsInitial();
}

class ReciptsLoading extends ReciptsState {
  const ReciptsLoading();
}

class ReciptsLoaded extends ReciptsState {
  const ReciptsLoaded(List<RecipeModel>? recipts) : super(recipts: recipts);
}

class ReciptsError extends ReciptsState {
  const ReciptsError(DioException? error) : super(error: error);
}
