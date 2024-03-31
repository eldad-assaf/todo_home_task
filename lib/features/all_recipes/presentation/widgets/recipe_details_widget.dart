import 'package:flutter/material.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/data/models/recipts_model.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/presentation/widgets/food_image.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/presentation/widgets/info_row.dart';

class ReceiptDetailsWidget extends StatelessWidget {
  final RecipeModel reciptModel;

  const ReceiptDetailsWidget({Key? key, required this.reciptModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(22)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: FoodImage(imageUrl: reciptModel.darkImage),
                  // child: Image.network(
                  //   reciptModel.darkImage,
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  reciptModel.name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
                InfoRow(
                  text: reciptModel.preparationTime,
                  iconData: Icons.timer,
                ),
                InfoRow(
                  text: reciptModel.foodBloggerName,
                  iconData: Icons.person,
                ),
                InfoRow(
                  text: reciptModel.instagramName,
                  iconData: Icons.chat,
                ),
                InfoRow(
                  text: reciptModel.tiktokName,
                  iconData: Icons.tiktok,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
