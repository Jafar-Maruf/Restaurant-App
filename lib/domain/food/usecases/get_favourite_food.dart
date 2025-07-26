part of '../index.dart';

class GetFavouriteFood extends UseCase<List<FoodWithImagesEntity>, void> {
  @override
  Future<Either<Failure, List<FoodWithImagesEntity>>> call([void param]) async {
    return await sl<FoodRepository>().getFavouriteFoods();
  }
}
