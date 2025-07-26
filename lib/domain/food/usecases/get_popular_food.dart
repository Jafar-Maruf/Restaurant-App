part of '../index.dart';

class GetPopularFood extends UseCase<List<FoodWithImagesEntity>, void> {
  @override
  Future<Either<Failure, List<FoodWithImagesEntity>>> call([void param]) async {
    return await sl<FoodRepository>().getPopularFoods();
  }
}
