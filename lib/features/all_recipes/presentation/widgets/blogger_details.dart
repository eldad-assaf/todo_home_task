import 'package:flutter/material.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/data/models/full_recipt_model.dart';

class BloggerDetails extends StatelessWidget {
  final DetailedRecipeModel fullReciptModel;

  const BloggerDetails({super.key, required this.fullReciptModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
            '${fullReciptModel.foodBlogger.name} - ${fullReciptModel.foodBlogger.shortDescription}'),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Text(fullReciptModel.foodBlogger.tiktokName),
                IconButton(
                  icon: const Icon(Icons.tiktok),
                  onPressed: () {},
                ),
              ],
            ),
            Text(fullReciptModel.foodBlogger.instagramName),
            IconButton(
              icon: const Icon(Icons.message),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
