import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_home_task_eldad/core/resources/data_state.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/data/models/recipts_model.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/domain/entities/recipe_entity.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/domain/usecases/fetch_all_recipts_usecase.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/presentation/bloc/recipes_bloc/recipe_event.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/presentation/bloc/recipes_bloc/recipe_state.dart';

class RecipesBloc extends Bloc<ReciptsEvent, ReciptsState> {
  final FetchAllRecipesUseCase _fetchAllReciptsUseCase;

  List<RecipeModel> pizzaRecipts = [];
  List<RecipeModel> pastaRecipts = [];
  List<RecipeModel> saladRecipts = [];
  List<RecipeModel> appetizerRecipts = [];
  List<RecipeModel> pastryRecipts = [];

  RecipesBloc(this._fetchAllReciptsUseCase) : super(const ReciptsInitial()) {
    on<FetchAllReciptsEvent>(_onFetchAllRecipts);
  }

  Future<void> _onFetchAllRecipts(
      FetchAllReciptsEvent event, Emitter<ReciptsState> emit) async {
    emit(const ReciptsLoading());

    final dataState = await _fetchAllReciptsUseCase();

    if (dataState is DataSuccess<List<RecipeEntity>>) {
      clearLists();

      populateLists(dataState);

      final List<RecipeModel> allRecipts = dataState.data!
          .map((entity) => RecipeModel.fromEntity(entity))
          .toList();

      emit(ReciptsLoaded(allRecipts));
    } else if (dataState is DataFailed) {
      emit(ReciptsError(dataState.error));
    }
  }

  void clearLists() {
    pizzaRecipts.clear();
    pastaRecipts.clear();
    saladRecipts.clear();
    appetizerRecipts.clear();
    pastryRecipts.clear();
  }

  populateLists(DataState<List<RecipeEntity>> allRecipts) {
    for (final receipt in allRecipts.data!) {
      if (receipt.subCategories.contains('PIZZA')) {
        pizzaRecipts.add(RecipeModel.fromEntity(receipt));
      } else if (receipt.subCategories.contains('PASTA')) {
        pastaRecipts.add(RecipeModel.fromEntity(receipt));
      } else if (receipt.subCategories.contains('SALAD')) {
        saladRecipts.add(RecipeModel.fromEntity(receipt));
      } else if (receipt.subCategories.contains('APPETIZER')) {
        appetizerRecipts.add(RecipeModel.fromEntity(receipt));
      } else if (receipt.subCategories.contains('PASTRY')) {
        pastryRecipts.add(RecipeModel.fromEntity(receipt));
      }
    }
  }
}
