// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_recipe_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailedRecipeEntity _$DetailedRecipeEntityFromJson(
        Map<String, dynamic> json) =>
    DetailedRecipeEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      preparationTime: json['preparationTime'] as String,
      lightImage: json['lightImage'] as String,
      likes: json['likes'] as int,
      rating: (json['rating'] as num).toDouble(),
      foodBlogger:
          FoodBlogger.fromJson(json['foodBlogger'] as Map<String, dynamic>),
      lightBanner: json['lightBanner'] as String,
      difficulty: (json['difficulty'] as num).toDouble(),
      servings: (json['servings'] as num).toDouble(),
      chefNotes: json['chefNotes'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      directions: (json['directions'] as List<dynamic>)
          .map((e) => Direction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailedRecipeEntityToJson(
        DetailedRecipeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'preparationTime': instance.preparationTime,
      'lightImage': instance.lightImage,
      'likes': instance.likes,
      'rating': instance.rating,
      'foodBlogger': instance.foodBlogger,
      'lightBanner': instance.lightBanner,
      'difficulty': instance.difficulty,
      'servings': instance.servings,
      'chefNotes': instance.chefNotes,
      'ingredients': instance.ingredients,
      'directions': instance.directions,
    };

FoodBlogger _$FoodBloggerFromJson(Map<String, dynamic> json) => FoodBlogger(
      name: json['name'] as String,
      shortDescription: json['shortDescription'] as String,
      instagramName: json['instagramName'] as String,
      tiktokName: json['tiktokName'] as String,
      lightProfileImage: json['lightProfileImage'] as String,
      instagramLink: json['instagramLink'] as String,
      tiktokLink: json['tiktokLink'] as String,
    );

Map<String, dynamic> _$FoodBloggerToJson(FoodBlogger instance) =>
    <String, dynamic>{
      'name': instance.name,
      'shortDescription': instance.shortDescription,
      'instagramName': instance.instagramName,
      'tiktokName': instance.tiktokName,
      'lightProfileImage': instance.lightProfileImage,
      'instagramLink': instance.instagramLink,
      'tiktokLink': instance.tiktokLink,
    };

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
      name: json['name'] as String,
      location: json['location'] as int,
      id: json['id'] as int,
      quantity: (json['quantity'] as num).toDouble(),
      barcodeCode: json['barcodeCode'] as String,
      ingredientType: json['ingredientType'] as String,
    );

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
      'id': instance.id,
      'quantity': instance.quantity,
      'barcodeCode': instance.barcodeCode,
      'ingredientType': instance.ingredientType,
    };

Direction _$DirectionFromJson(Map<String, dynamic> json) => Direction(
      location: json['location'] as int,
      id: json['id'] as int,
      description: json['description'] as String,
    );

Map<String, dynamic> _$DirectionToJson(Direction instance) => <String, dynamic>{
      'location': instance.location,
      'id': instance.id,
      'description': instance.description,
    };
