import 'package:flutter/material.dart';
import 'package:food_app_home_task_eldad/core/helpers/dish_difficulty_converter.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/data/models/full_recipt_model.dart';

class DishPreparationTime extends StatelessWidget {
  final DetailedRecipeModel fullReciptModel;

  const DishPreparationTime({super.key, required this.fullReciptModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Text(
                  '${fullReciptModel.preparationTime} דקות ',
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text('זמן הכנה משוער')
              ],
            ),
            const SizedBox(
              width: 6,
            ),
            Column(
              children: [
                Text(
                  fullReciptModel.difficulty.toFractionString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text('רמת קושי')
              ],
            )
          ],
        ));
  }
}
