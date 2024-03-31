import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/data/models/full_recipt_model.dart';

abstract class SpecificReciptState extends Equatable {
  final DetailedRecipeModel? fullRecipt;
  final DioException? error;

  const SpecificReciptState({this.fullRecipt, this.error});

  @override
  List<Object?> get props => [fullRecipt, error];
}

class SpecificReciptInitial extends SpecificReciptState {
  const SpecificReciptInitial();
}

class SpecificReciptLoading extends SpecificReciptState {
  const SpecificReciptLoading();
}

class SpecificReciptLoaded extends SpecificReciptState {
  const SpecificReciptLoaded(DetailedRecipeModel? fullRecipt)
      : super(fullRecipt: fullRecipt);
}

class SpecificReciptError extends SpecificReciptState {
  const SpecificReciptError(DioException? error) : super(error: error);
}
