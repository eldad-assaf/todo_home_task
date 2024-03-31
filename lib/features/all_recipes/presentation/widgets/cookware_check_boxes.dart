import 'package:flutter/material.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/data/models/full_recipt_model.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/domain/entities/detailed_recipe_entity.dart';

class CookwareCheckBoxes extends StatefulWidget {
  final DetailedRecipeModel fullReciptModel;

  const CookwareCheckBoxes({
    Key? key,
    required this.fullReciptModel,
  }) : super(key: key);

  @override
  State<CookwareCheckBoxes> createState() => _CookwareCheckBoxesState();
}

class _CookwareCheckBoxesState extends State<CookwareCheckBoxes> {
  List<bool> _checkedList = [];
  List<Ingredient> _cookWareIngredients = [];
  int? numberOfSrvings;

  @override
  void initState() {
    super.initState();

    _cookWareIngredients = widget.fullReciptModel.ingredients
        .where((ingredient) => ingredient.ingredientType == "KITCHEN")
        .toList();
    _checkedList = List<bool>.filled(_cookWareIngredients.length, false);
  }

  @override
  Widget build(BuildContext context) {
    widget.fullReciptModel.servings.toString();
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: _cookWareIngredients.length,
            itemBuilder: (context, index) {
              final ingredient = _cookWareIngredients[index];
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
