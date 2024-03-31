import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app_home_task_eldad/features/all_recipes/data/models/full_recipt_model.dart';

class RecipeHeader extends StatefulWidget {
  final DetailedRecipeModel fullReciptModel;
  const RecipeHeader({super.key, required this.fullReciptModel});

  @override
  State<RecipeHeader> createState() => _RecipeHeaderState();
}

class _RecipeHeaderState extends State<RecipeHeader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Stack(
        children: [
          SizedBox(
            height: 300,
            child: CachedNetworkImage(
              imageUrl: widget.fullReciptModel.lightImage,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height / 4,
              width: double.infinity,
            ),
          ),
          Positioned(
            bottom: 15,
            left: MediaQuery.of(context).size.width / 2.2,
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              alignment: Alignment.topRight,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl:
                      widget.fullReciptModel.foodBlogger.lightProfileImage,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.width / 4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
