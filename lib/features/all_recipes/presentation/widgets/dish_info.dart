import 'package:flutter/material.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/data/models/full_recipt_model.dart';

class DishInfo extends StatelessWidget {
  final DetailedRecipeModel fullReciptModel;

  const DishInfo({super.key, required this.fullReciptModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            fullReciptModel.name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            fullReciptModel.description,
            textDirection: TextDirection.rtl,
            style: const TextStyle(fontSize: 13),
          )
        ],
      ),
    );
  }
}
