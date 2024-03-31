import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/presentation/bloc/recipes_bloc/recipe_bloc.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/presentation/bloc/recipes_bloc/recipe_state.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/presentation/widgets/recipes_list_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.local_pizza),
                text: "PIZZA",
              ),
              Tab(
                icon: Icon(Icons.local_dining),
                text: "PASTA",
              ),
              Tab(
                icon: Icon(Icons.health_and_safety),
                text: "SALAD",
              ),
              Tab(
                icon: Icon(Icons.video_call),
                text: "APPETIZER",
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: "PASTRY",
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            BlocBuilder<RecipesBloc, ReciptsState>(
              builder: (context, state) {
                if (state is ReciptsInitial || state is ReciptsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ReciptsError) {
                  return const Center(
                    child: Text('state.error'),
                  );
                }
                return const TabBarView(
                  children: [
                    RecipesListView(foodType: RecipesType.pizzaRecipes),
                    RecipesListView(foodType: RecipesType.pastaRecipes),
                    RecipesListView(foodType: RecipesType.saladRecipes),
                    RecipesListView(foodType: RecipesType.appetizerRecipes),
                    RecipesListView(foodType: RecipesType.pastryRecipes),
                  ],
                );
              },
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _searchController.clear();
                        // Implement search functionality here
                      },
                      icon: const Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
