import 'package:food_app_home_task_eldad/features/all_recipes/domain/entities/recipe_entity.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/domain/repositories/recipts_repository.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';

class FetchAllRecipesUseCase
    implements UseCase<DataState<List<RecipeEntity>>, void> {
  final ReciptsRepository _reciptsRepository;
  FetchAllRecipesUseCase(this._reciptsRepository);

  @override
  Future<DataState<List<RecipeEntity>>> call({void params}) {
    return _reciptsRepository.fetchAllRecipts();
  }
}
