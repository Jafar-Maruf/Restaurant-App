part of '../index.dart';

class FoodImageModel {
  final String foodId;
  final String altText;
  final String imageUrl;

  const FoodImageModel({
    required this.foodId,
    required this.altText,
    required this.imageUrl,
  });

  factory FoodImageModel.fromJson(Map<String, dynamic> json) {
    return FoodImageModel(
      foodId: json['food_item_id'] as String,
      altText: json['alt_text'] as String,
      imageUrl: json['image_url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'food_item_id': foodId, 'alt_text': altText, 'image_url': imageUrl};
  }
}

extension FoodImageXModel on FoodImageModel {
  FoodImageEntity toEntity() {
    return FoodImageEntity(
      foodId: foodId,
      altText: altText,
      imageUrl: imageUrl,
    );
  }
}
