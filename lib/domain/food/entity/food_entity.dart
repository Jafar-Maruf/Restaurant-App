part of '../index.dart';

class FoodEntity {
  final String foodId;
  final String categoryId;
  final String title;
  final String description;
  final String type;
  final String price;

  const FoodEntity({
    required this.foodId,
    required this.categoryId,
    required this.title,
    required this.price,
    required this.description,
    required this.type,
  });
}
