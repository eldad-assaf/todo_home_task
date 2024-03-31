import 'package:food_app_home_task_eldad/features/all_recipes/domain/entities/detailed_recipe_entity.dart';

class DetailedRecipeModel extends DetailedRecipeEntity {
  const DetailedRecipeModel({
    required int id,
    required String lightImage,
    required String darkImage,
    required String name,
    required String description,
    required bool popular,
    required String preparationTime,
    required int likes,
    required bool promoted,
    required double rating,
    required FoodBlogger foodBlogger,
    required String lightBanner,
    required double difficulty,
    required double servings,
    required String chefNotes,
    required List<Ingredient> ingredients,
    required List<Direction> directions,
  }) : super(
          id: id,
          name: name,
          description: description,
          preparationTime: preparationTime,
          lightImage: lightImage,
          likes: likes,
          rating: rating,
          foodBlogger: foodBlogger,
          lightBanner: lightBanner,
          difficulty: difficulty,
          servings: servings,
          chefNotes: chefNotes,
          ingredients: ingredients,
          directions: directions,
        );

  factory DetailedRecipeModel.fromJson(Map<String, dynamic> json) {
    return DetailedRecipeModel(
      id: json['id'] ?? 0,
      lightImage: json['lightImage'] ?? '',
      darkImage: json['darkImage'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      popular: false,
      preparationTime: json['preparationTime'] ?? '',
      likes: json['likes'] ?? 0,
      promoted: false, // No 'promoted' field in JSON, default to false
      rating: (json['rating'] ?? 0.0).toDouble(),
      foodBlogger: FoodBlogger.fromJson(json['foodBlogger'] ?? {}),
      lightBanner: json['lightBanner'] ?? '',
      difficulty: json['difficulty'] ?? 0.0,
      servings: json['servings'] ?? 0.0,
      chefNotes: json['chefNotes'] ?? '',
      ingredients: List<Ingredient>.from((json['ingredients'] ?? [])
          .map((ingredient) => Ingredient.fromJson(ingredient))),
      directions: List<Direction>.from((json['directions'] ?? [])
          .map((direction) => Direction.fromJson(direction))),
    );
  }

  factory DetailedRecipeModel.fromEntity(DetailedRecipeEntity entity) {
    return DetailedRecipeModel(
      id: entity.id,
      lightImage: entity.lightImage,
      darkImage: '', // No darkImage in entity, set empty string
      name: entity.name,
      description: entity.description,
      popular: false, // No 'popular' field in entity, default to false
      preparationTime: entity.preparationTime,
      likes: entity.likes,
      promoted: false, // No 'promoted' field in entity, default to false
      rating: entity.rating,
      foodBlogger: entity.foodBlogger,
      lightBanner: entity.lightBanner,
      difficulty: entity.difficulty,
      servings: entity.servings,
      chefNotes: entity.chefNotes,
      ingredients: entity.ingredients,
      directions: entity.directions,
    );
  }
}
