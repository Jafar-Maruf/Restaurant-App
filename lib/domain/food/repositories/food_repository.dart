part of '../index.dart';

abstract class FoodRepository {
  Future<Either<Failure, List<FoodWithImagesEntity>>> getFavouriteFoods();

  Future<Either<Failure, List<FoodWithImagesEntity>>> getPopularFoods();

  Future<Either<Failure, List<FoodWithImagesEntity>>> getFoodsByCategoryName(
    String categoryName,
  );
}
