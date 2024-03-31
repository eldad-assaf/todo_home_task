import 'package:food_app_home_task_eldad/core/resources/data_state.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/domain/entities/detailed_recipe_entity.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/domain/entities/recipe_entity.dart';

abstract class ReciptsRepository {
  Future<DataState<List<RecipeEntity>>> fetchAllRecipts();
  Future<DataState<DetailedRecipeEntity>> fetchSpecificRecipt(
      {required String id});
}
