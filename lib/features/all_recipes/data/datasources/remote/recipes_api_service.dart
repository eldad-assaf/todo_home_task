import 'package:food_app_home_task_eldad/core/constants.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/domain/entities/detailed_recipe_entity.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/domain/entities/recipe_entity.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'recipes_api_service.g.dart';

//**see Dio instructions on pubdev - needs build runner to generate a file */
@RestApi(baseUrl: reciptsAPIBaseURL)
abstract class RecipesApiService {
  factory RecipesApiService(Dio dio) = _RecipesApiService;

  @GET('/getAllRecipes')
  Future<HttpResponse<List<RecipeEntity>>> fetchAllRecipes();

  @GET('/details/{id}')
  Future<HttpResponse<DetailedRecipeEntity>> fetchSpecificRecipe(
      @Path('id') String id);
}
