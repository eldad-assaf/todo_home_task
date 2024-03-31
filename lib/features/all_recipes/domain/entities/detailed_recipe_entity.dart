import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'detailed_recipe_entity.g.dart';

@JsonSerializable()
class DetailedRecipeEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final String preparationTime;
  final String lightImage;
  final int likes;
  final double rating;
  final FoodBlogger foodBlogger;
  final String lightBanner;
  final double difficulty;
  final double servings;
  final String chefNotes;
  final List<Ingredient> ingredients;
  final List<Direction> directions;

  const DetailedRecipeEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.preparationTime,
    required this.lightImage,
    required this.likes,
    required this.rating,
    required this.foodBlogger,
    required this.lightBanner,
    required this.difficulty,
    required this.servings,
    required this.chefNotes,
    required this.ingredients,
    required this.directions,
  });

  factory DetailedRecipeEntity.fromJson(Map<String, dynamic> json) =>
      _$DetailedRecipeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DetailedRecipeEntityToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        preparationTime,
        lightImage,
        likes,
        rating,
        foodBlogger,
        lightBanner,
        difficulty,
        servings,
        chefNotes,
        ingredients,
        directions,
      ];
}

@JsonSerializable()
class FoodBlogger {
  final String name;
  final String shortDescription;
  final String instagramName;
  final String tiktokName;
  final String lightProfileImage;
  final String instagramLink;
  final String tiktokLink;

  const FoodBlogger({
    required this.name,
    required this.shortDescription,
    required this.instagramName,
    required this.tiktokName,
    required this.lightProfileImage,
    required this.instagramLink,
    required this.tiktokLink,
  });

  factory FoodBlogger.fromJson(Map<String, dynamic> json) =>
      _$FoodBloggerFromJson(json);

  Map<String, dynamic> toJson() => _$FoodBloggerToJson(this);
}

@JsonSerializable()
class Ingredient {
  final String name;
  final int location;
  final int id;
  final double quantity;
  final String barcodeCode;
  final String ingredientType;

  const Ingredient({
    required this.name,
    required this.location,
    required this.id,
    required this.quantity,
    required this.barcodeCode,
    required this.ingredientType,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}

@JsonSerializable()
class Direction {
  final int location;
  final int id;
  final String description;

  const Direction({
    required this.location,
    required this.id,
    required this.description,
  });

  factory Direction.fromJson(Map<String, dynamic> json) =>
      _$DirectionFromJson(json);

  Map<String, dynamic> toJson() => _$DirectionToJson(this);
}
