part of '../index.dart';

class FoodRepositoryImpl extends FoodRepository {
  @override
  Future<Either<Failure, List<FoodWithImagesEntity>>>
  getFavouriteFoods() async {
    try {
      var result = await sl<FoodFirebaseService>().getFavouriteFoods();
      return Right(result);
    } on Exception catch (e) {
      return Left(FirebaseExceptionMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, List<FoodWithImagesEntity>>> getFoodsByCategoryName(
    String categoryName,
  ) async {
    try {
      var result = await sl<FoodFirebaseService>().getFoodsByCategoryName(
        categoryName: categoryName,
      );
      return Right(result);
    } on Exception catch (e) {
      return Left(FirebaseExceptionMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, List<FoodWithImagesEntity>>> getPopularFoods() async {
    try {
      var result = await sl<FoodFirebaseService>().getPopularFoods();
      return Right(result);
    } on Exception catch (e) {
      return Left(FirebaseExceptionMapper.map(e));
    }
  }
}
