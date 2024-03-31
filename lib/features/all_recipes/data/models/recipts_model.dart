import 'package:food_app_home_task_eldad/features/all_recipes/domain/entities/recipe_entity.dart';

class RecipeModel extends RecipeEntity {
  const RecipeModel({
    required int id,
    required String lightImage,
    required String darkImage,
    required String name,
    required bool popular,
    required String preparationTime,
    required int likes,
    required bool promoted,
    required double rating,
    required int foodBloggerId,
    required String tiktokName,
    required String instagramName,
    required String foodBloggerName,
    required String foodBloggerShortDescription,
    required List<String> subCategories,
  }) : super(
          id: id,
          lightImage: lightImage,
          darkImage: darkImage,
          name: name,
          popular: popular,
          preparationTime: preparationTime,
          likes: likes,
          promoted: promoted,
          rating: rating,
          foodBloggerId: foodBloggerId,
          tiktokName: tiktokName,
          instagramName: instagramName,
          foodBloggerName: foodBloggerName,
          foodBloggerShortDescription: foodBloggerShortDescription,
          subCategories: subCategories,
        );

  factory RecipeModel.fromJson(Map<String, dynamic> map) {
    return RecipeModel(
      id: map['id'] ?? 0,
      lightImage: map['lightImage'] ?? "",
      darkImage: map['darkImage'] ?? "",
      name: map['name'] ?? "",
      popular: map['popular'] ?? false,
      preparationTime: map['preparationTime'] ?? "",
      likes: map['likes'] ?? 0,
      promoted: map['promoted'] ?? false,
      rating: (map['rating'] ?? 0.0).toDouble(),
      foodBloggerId: map['foodBloggerId'] ?? 0,
      tiktokName: map['tiktokName'] ?? "",
      instagramName: map['instagramName'] ?? "",
      foodBloggerName: map['foodBloggerName'] ?? "",
      foodBloggerShortDescription: map['foodBloggerShortDescription'] ?? "",
      subCategories: List<String>.from(map['subCategories'] ?? []),
    );
  }

  factory RecipeModel.fromEntity(RecipeEntity entity) {
    return RecipeModel(
      id: entity.id,
      lightImage: entity.lightImage,
      darkImage: entity.darkImage,
      name: entity.name,
      popular: entity.popular,
      preparationTime: entity.preparationTime,
      likes: entity.likes,
      promoted: entity.promoted,
      rating: entity.rating,
      foodBloggerId: entity.foodBloggerId,
      tiktokName: entity.tiktokName,
      instagramName: entity.instagramName,
      foodBloggerName: entity.foodBloggerName,
      foodBloggerShortDescription: entity.foodBloggerShortDescription,
      subCategories: entity.subCategories,
    );
  }
}
