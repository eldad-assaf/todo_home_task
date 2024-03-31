import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/presentation/pages/detailed_recipe_page.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/data/models/recipts_model.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/presentation/bloc/recipes_bloc/recipe_bloc.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/presentation/widgets/recipe_details_widget.dart';

enum RecipesType {
  pizzaRecipes,
  pastaRecipes,
  saladRecipes,
  appetizerRecipes,
  pastryRecipes
}

class RecipesListView extends StatefulWidget {
  final RecipesType foodType;

  const RecipesListView({super.key, required this.foodType});

  @override
  State<RecipesListView> createState() => _RecipesListViewState();
}

class _RecipesListViewState extends State<RecipesListView> {
  @override
  Widget build(BuildContext context) {
    final recipesBloc = BlocProvider.of<RecipesBloc>(context);

    final List<RecipeModel> recipes =
        getRecipesForType(widget.foodType, recipesBloc);

    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailedRecipePage(
                recipeModel: recipes[index],
              ),
            ),
          ),
          child: ReceiptDetailsWidget(
            reciptModel: recipes[index],
          ),
        );
      },
    );
  }

//returns the wanted list from the bloc
  List<RecipeModel> getRecipesForType(
      RecipesType reciptsType, RecipesBloc reciptsBloc) {
    switch (reciptsType) {
      case RecipesType.pizzaRecipes:
        return reciptsBloc.pizzaRecipts;
      case RecipesType.pastaRecipes:
        return reciptsBloc.pastaRecipts;
      case RecipesType.saladRecipes:
        return reciptsBloc.saladRecipts;
      case RecipesType.appetizerRecipes:
        return reciptsBloc.appetizerRecipts;
      case RecipesType.pastryRecipes:
        return reciptsBloc.pastryRecipts;
      default:
        return [];
    }
  }
}
