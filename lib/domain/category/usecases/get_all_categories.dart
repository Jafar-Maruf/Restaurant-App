part of '../index.dart';

class GetAllCategories extends UseCase<List<CategoryEntity>, void> {
  @override
  Future<Either<Failure, List<CategoryEntity>>> call([void param]) async {
    return await sl<CategoryRepository>().getCategories();
  }
}
