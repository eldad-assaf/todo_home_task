import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/presentation/bloc/recipes_bloc/recipe_event.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/presentation/bloc/specific_recipe_bloc/specific_recipe_bloc.dart';
import 'package:food_app_home_task_eldad/home.dart';
import 'package:food_app_home_task_eldad/injection_container.dart';
import 'features/all_recipes/presentation/bloc/recipes_bloc/recipe_bloc.dart';

void main() async {
  await initializeDependencies();
  Bloc.observer = const AppBlocObserver();

  runApp(const MyApp());
}

class AppBlocObserver extends BlocObserver {
  /// {@macro app_bloc_observer}
  const AppBlocObserver();

  @override
  void onChange(BlocBase bloc, Change change) {
    log(bloc.toString());

    log(change.toString());
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RecipesBloc>(
          create: (context) => sl()..add(const FetchAllReciptsEvent()),
        ),
        BlocProvider<SpecificReciptBloc>(
          create: (context) => sl(),
        ),
      ],
      child: const MaterialApp(
        title: 'Recipes App',
        home: Home(),
      ),
    );
  }
}
