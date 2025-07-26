part of '../index.dart';

class FoodWithImagesEntity {
  final FoodEntity food;
  final List<FoodImageEntity> images;

  const FoodWithImagesEntity({
    required this.food,
    required this.images,
  });
}