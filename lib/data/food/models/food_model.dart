part of '../index.dart';

class FoodModel {
  final String foodId;
  final String categoryId;
  final String title;
  final String description;
  final String type;
  final String price;

  const FoodModel({
    required this.foodId,
    required this.categoryId,
    required this.title,
    required this.price,
    required this.description,
    required this.type,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      foodId: json['food_item_id'] as String,
      categoryId: json['category_id'] as String,
      title: json['title'] as String,
      price: json['price'] as String,
      type: json['type'] as String,
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'food_item_id': foodId,
      'category_id': categoryId,
      'title': title,
      'price': price,
      'type': type,
      'description': description,
    };
  }
}

extension FoodXModel on FoodModel {
  FoodEntity toEntity() {
    return FoodEntity(
      foodId: foodId,
      categoryId: categoryId,
      title: title,
      price: price,
      description: description,
      type: type,
    );
  }
}
