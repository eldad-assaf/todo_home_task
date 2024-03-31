import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';
part 'recipe_entity.g.dart';

@JsonSerializable()
class RecipeEntity extends Equatable {
  final int id;
  final String lightImage;
  final String darkImage;
  final String name;
  final bool popular;
  final String preparationTime;
  final int likes;
  final bool promoted;
  final double rating;
  final int foodBloggerId;
  final String tiktokName;
  final String instagramName;
  final String foodBloggerName;
  final String foodBloggerShortDescription;
  final List<String> subCategories;

  Map<String, dynamic> toJson() => _$RecipeEntityToJson(this);

  const RecipeEntity({
    required this.id,
    required this.lightImage,
    required this.darkImage,
    required this.name,
    required this.popular,
    required this.preparationTime,
    required this.likes,
    required this.promoted,
    required this.rating,
    required this.foodBloggerId,
    required this.tiktokName,
    required this.instagramName,
    required this.foodBloggerName,
    required this.foodBloggerShortDescription,
    required this.subCategories,
  });
  factory RecipeEntity.fromJson(Map<String, dynamic> json) =>
      _$RecipeEntityFromJson(json);

  @override
  List<Object?> get props => [
        id,
        lightImage,
        darkImage,
        name,
        popular,
        preparationTime,
        likes,
        promoted,
        rating,
        foodBloggerId,
        tiktokName,
        instagramName,
        foodBloggerName,
        foodBloggerShortDescription,
        subCategories,
      ];
}
