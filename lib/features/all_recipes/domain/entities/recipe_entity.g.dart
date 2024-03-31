// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeEntity _$RecipeEntityFromJson(Map<String, dynamic> json) => RecipeEntity(
      id: json['id'] as int,
      lightImage: json['lightImage'] as String,
      darkImage: json['darkImage'] as String,
      name: json['name'] as String,
      popular: json['popular'] as bool,
      preparationTime: json['preparationTime'] as String,
      likes: json['likes'] as int,
      promoted: json['promoted'] as bool,
      rating: (json['rating'] as num).toDouble(),
      foodBloggerId: json['foodBloggerId'] as int,
      tiktokName: json['tiktokName'] as String,
      instagramName: json['instagramName'] as String,
      foodBloggerName: json['foodBloggerName'] as String,
      foodBloggerShortDescription:
          json['foodBloggerShortDescription'] as String,
      subCategories: (json['subCategories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RecipeEntityToJson(RecipeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lightImage': instance.lightImage,
      'darkImage': instance.darkImage,
      'name': instance.name,
      'popular': instance.popular,
      'preparationTime': instance.preparationTime,
      'likes': instance.likes,
      'promoted': instance.promoted,
      'rating': instance.rating,
      'foodBloggerId': instance.foodBloggerId,
      'tiktokName': instance.tiktokName,
      'instagramName': instance.instagramName,
      'foodBloggerName': instance.foodBloggerName,
      'foodBloggerShortDescription': instance.foodBloggerShortDescription,
      'subCategories': instance.subCategories,
    };
