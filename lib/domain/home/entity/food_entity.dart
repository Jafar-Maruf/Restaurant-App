part of '../index.dart';

class FoodEntity {
  final String? id;
  final String title;
  final List<String> imageUrls;
  final String price;

  const FoodEntity({
    this.id,
    required this.title,
    required this.imageUrls,
    required this.price,
  });
}
