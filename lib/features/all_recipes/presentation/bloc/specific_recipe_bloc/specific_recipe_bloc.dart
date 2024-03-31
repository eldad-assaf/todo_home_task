import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_home_task_eldad/core/resources/data_state.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/data/models/full_recipt_model.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/domain/entities/detailed_recipe_entity.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/domain/usecases/fetch_specific_recipt_usecase.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/presentation/bloc/specific_recipe_bloc/specific_recipe_event.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/presentation/bloc/specific_recipe_bloc/specific_recipt_state.dart';

class SpecificReciptBloc
    extends Bloc<SpecificReciptsEvent, SpecificReciptState> {
  final FetchSpecificReciptUseCase _fetchSpecificReciptUseCase;

  SpecificReciptBloc(this._fetchSpecificReciptUseCase)
      : super(const SpecificReciptInitial()) {
    on<FetchSpecificRecipeEvent>(_onFetchSpecificRecipt);
  }

  Future<void> _onFetchSpecificRecipt(
      FetchSpecificRecipeEvent event, Emitter<SpecificReciptState> emit) async {
    emit(const SpecificReciptLoading());

    final dataState = await _fetchSpecificReciptUseCase(params: event.recipeId);

    if (dataState is DataSuccess<DetailedRecipeEntity>) {
      final DetailedRecipeModel recipt =
          DetailedRecipeModel.fromEntity(dataState.data!);
      emit(SpecificReciptLoaded(recipt));
    } else if (dataState is DataFailed) {
      emit(SpecificReciptError(dataState.error));
    }
  }
}
