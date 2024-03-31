import 'package:food_app_home_task_eldad/features/all_recipes/domain/entities/detailed_recipe_entity.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/domain/repositories/recipts_repository.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';

class FetchSpecificReciptUseCase
    implements UseCase<DataState<DetailedRecipeEntity>, String> {
  final ReciptsRepository _reciptsRepository;
  FetchSpecificReciptUseCase(this._reciptsRepository);

  @override
  Future<DataState<DetailedRecipeEntity>> call({String? params}) {
    return _reciptsRepository.fetchSpecificRecipt(id: params!);
  }
}
