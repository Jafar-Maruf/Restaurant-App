part of '../index.dart';

class GetFoodByCategoryName
    extends UseCase<List<FoodWithImagesEntity>, String> {
  @override
  Future<Either<Failure, List<FoodWithImagesEntity>>> call([
    String? param,
  ]) async {
    return await sl<FoodRepository>().getFoodsByCategoryName(param!);
  }
}
