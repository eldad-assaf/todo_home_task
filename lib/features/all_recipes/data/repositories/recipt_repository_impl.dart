import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:food_app_home_task_eldad/core/resources/data_state.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/data/datasources/remote/recipes_api_service.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/domain/entities/detailed_recipe_entity.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/domain/entities/recipe_entity.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/domain/repositories/recipts_repository.dart';

class ReciptsRepositoryImpl extends ReciptsRepository {
  final RecipesApiService _reciptsApiService;
  ReciptsRepositoryImpl(this._reciptsApiService);
  @override
  Future<DataState<List<RecipeEntity>>> fetchAllRecipts() async {
    try {
      final httpResponse = await _reciptsApiService.fetchAllRecipes();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      log('DioException:');
      log(e.toString());
      log(e.message.toString());
      log(e.error.toString());
      log(e.response!.statusMessage.toString());

      return DataFailed(e);
    }
  }

  @override
  Future<DataState<DetailedRecipeEntity>> fetchSpecificRecipt(
      {required String id}) async {
    try {
      final httpResponse = await _reciptsApiService.fetchSpecificRecipe(id);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      log('DioException:');
      log(e.toString());
      log(e.message.toString());
      log(e.error.toString());
      log(e.response!.statusMessage.toString());

      return DataFailed(e);
    }
  }
}
