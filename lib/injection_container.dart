// ignore_for_file: avoid_print
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/data/datasources/remote/recipes_api_service.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/data/repositories/recipt_repository_impl.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/domain/repositories/recipts_repository.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/domain/usecases/fetch_all_recipts_usecase.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/domain/usecases/fetch_specific_recipt_usecase.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/presentation/bloc/specific_recipe_bloc/specific_recipe_bloc.dart';
import 'package:get_it/get_it.dart';
import 'features/all_recipes/presentation/bloc/recipes_bloc/recipe_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  try {
    sl.registerSingleton<Dio>(Dio());

    //Dependencies
    sl.registerSingleton<RecipesApiService>(RecipesApiService(sl()));
    sl.registerSingleton<ReciptsRepository>(ReciptsRepositoryImpl(sl()));

    //UseCases

    sl.registerSingleton<FetchAllRecipesUseCase>(FetchAllRecipesUseCase(sl()));
    sl.registerSingleton<FetchSpecificReciptUseCase>(
        FetchSpecificReciptUseCase(sl()));

    //Blocs

    sl.registerFactory<RecipesBloc>(() => RecipesBloc(sl()));
    sl.registerFactory<SpecificReciptBloc>(() => SpecificReciptBloc(sl()));
  } catch (e) {
    log('error in initializeDependencies $e');
  }
}
