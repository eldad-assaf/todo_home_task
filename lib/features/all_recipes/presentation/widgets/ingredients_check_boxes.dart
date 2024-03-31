import 'package:flutter/material.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/data/models/full_recipt_model.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/domain/entities/detailed_recipe_entity.dart';

class IngredientsCheckBoxes extends StatefulWidget {
  final DetailedRecipeModel fullReciptModel;

  const IngredientsCheckBoxes({
    Key? key,
    required this.fullReciptModel,
  }) : super(key: key);

  @override
  State<IngredientsCheckBoxes> createState() => _IngredientsCheckBoxesState();
}

class _IngredientsCheckBoxesState extends State<IngredientsCheckBoxes> {
  List<bool> _checkedList = [];
  List<Ingredient> _foodIngredients = [];
  int? numberOfSrvings;

  @override
  void initState() {
    super.initState();
    _foodIngredients = widget.fullReciptModel.ingredients
        .where((ingredient) => ingredient.ingredientType == "FOOD")
        .toList();

    _checkedList = List<bool>.filled(_foodIngredients.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '${widget.fullReciptModel.servings.toInt()} מנות ',
              textDirection: TextDirection.rtl,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              '-מצרכים ל',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: _foodIngredients.length,
            itemBuilder: (context, index) {
              final ingredient = _foodIngredients[index];
              return CheckboxListTile(
                title: Text(
                  ingredient.name,
                  style: const TextStyle(fontSize: 12),
                ),
                value: _checkedList[index],
                onChanged: (newValue) {
                  setState(() {
                    _checkedList[index] = newValue!;
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
