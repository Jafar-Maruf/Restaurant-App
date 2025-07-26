part of '../index.dart';

abstract class FoodFirebaseService {
  Future<List<FoodWithImagesEntity>> getFavouriteFoods();

  Future<List<FoodWithImagesEntity>> getPopularFoods();

  Future<List<FoodWithImagesEntity>> getFoodsByCategoryName({
    required String categoryName,
  });
}

class FoodFirebaseServiceImpl extends FoodFirebaseService {
  @override
  Future<List<FoodWithImagesEntity>> getFoodsByCategoryName({
    String categoryName = 'Burger',
  }) async {
    final firebase = FirebaseFirestore.instance;
    final categorySnapshot = await firebase
        .collection('categories')
        .where('title', isEqualTo: categoryName)
        .limit(1)
        .get();

    if (categorySnapshot.docs.isEmpty) {
      return [];
    }

    final categoryId = categorySnapshot.docs.first.data()['category_id'];

    final foodsSnapshot = await firebase
        .collection('food_items')
        .where('category_id', isEqualTo:categoryId)
        .get();

    final foodsEntity = foodsSnapshot.docs
        .map((doc) => FoodModel.fromJson(doc.data()).toEntity())
        .toList();

    List<FoodWithImagesEntity> foodWithImages = [];
    for (final food in foodsEntity) {
      final imagesSnapshot = await firebase
          .collection('food_images')
          .where('food_item_id', isEqualTo: food.foodId)
          .get();

      final imagesEntity = imagesSnapshot.docs
          .map((imgDoc) => FoodImageModel.fromJson(imgDoc.data()).toEntity())
          .toList();

      foodWithImages.add(
        FoodWithImagesEntity(food: food, images: imagesEntity),
      );
    }
    return foodWithImages;
  }

  @override
  Future<List<FoodWithImagesEntity>> getFavouriteFoods() async {
    final firebase = FirebaseFirestore.instance;

    var data = await firebase
        .collection('food_items')
        .where('type', isEqualTo: 'favourite')
        .get();
    List<FoodEntity> foodsEntity = data.docs
        .map((foodItem) => FoodModel.fromJson(foodItem.data()).toEntity())
        .toList();
    List<FoodWithImagesEntity> foodWithImages = [];
    for (final food in foodsEntity) {
      final imagesSnapshot = await firebase
          .collection('food_images')
          .where('food_item_id', isEqualTo: food.foodId)
          .get();

      final imagesEntity = imagesSnapshot.docs
          .map((imgDoc) => FoodImageModel.fromJson(imgDoc.data()).toEntity())
          .toList();

      foodWithImages.add(
        FoodWithImagesEntity(food: food, images: imagesEntity),
      );
    }

    return foodWithImages;
  }

  @override
  Future<List<FoodWithImagesEntity>> getPopularFoods() async {
    final firebase = FirebaseFirestore.instance;

    var data = await firebase
        .collection('food_items')
        .where('type', isEqualTo: 'popular')
        .get();
    List<FoodEntity> foodsEntity = data.docs
        .map((foodItem) => FoodModel.fromJson(foodItem.data()).toEntity())
        .toList();
    List<FoodWithImagesEntity> foodWithImages = [];
    for (final food in foodsEntity) {
      final imagesSnapshot = await firebase
          .collection('food_images')
          .where('food_item_id', isEqualTo: food.foodId)
          .get();

      final imagesEntity = imagesSnapshot.docs
          .map((imgDoc) => FoodImageModel.fromJson(imgDoc.data()).toEntity())
          .toList();

      foodWithImages.add(
        FoodWithImagesEntity(food: food, images: imagesEntity),
      );
    }

    return foodWithImages;
  }
}
