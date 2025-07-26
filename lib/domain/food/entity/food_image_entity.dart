part of '../index.dart';

class FoodImageEntity {
  final String foodId;
  final String altText;
  final String imageUrl;

  const FoodImageEntity({
    required this.foodId,
    required this.altText,
    required this.imageUrl,
  });
}
