import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/presentation/widgets/recipe_header.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/data/models/recipts_model.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/presentation/bloc/specific_recipe_bloc/specific_recipe_bloc.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/presentation/bloc/specific_recipe_bloc/specific_recipe_event.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/presentation/bloc/specific_recipe_bloc/specific_recipt_state.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/presentation/widgets/cookware_check_boxes.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/presentation/widgets/blogger_details.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/presentation/widgets/dish_info.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/presentation/widgets/dish_preparation_time.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/presentation/widgets/ingredients_check_boxes.dart';

class DetailedRecipePage extends StatefulWidget {
  final RecipeModel recipeModel;

  const DetailedRecipePage({Key? key, required this.recipeModel})
      : super(key: key);

  @override
  State<DetailedRecipePage> createState() => _DetailedRecipePageState();
}

class _DetailedRecipePageState extends State<DetailedRecipePage> {
  @override
  void initState() {
    BlocProvider.of<SpecificReciptBloc>(context)
        .add(FetchSpecificRecipeEvent(widget.recipeModel.id.toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<SpecificReciptBloc, SpecificReciptState>(
        builder: (context, state) {
          if (state is SpecificReciptInitial ||
              state is SpecificReciptLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is SpecificReciptError) {
            return Center(
              child: Text(state.error!.message!.toString()),
            );
          }
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RecipeHeader(fullReciptModel: state.fullRecipt!),
                BloggerDetails(fullReciptModel: state.fullRecipt!),
                DishInfo(fullReciptModel: state.fullRecipt!),
                const Divider(),
                DishPreparationTime(fullReciptModel: state.fullRecipt!),
                const Divider(),
                IngredientsCheckBoxes(fullReciptModel: state.fullRecipt!),
                const Divider(),
                CookwareCheckBoxes(fullReciptModel: state.fullRecipt!),
              ],
            ),
          );
        },
      ),
    );
  }
}
