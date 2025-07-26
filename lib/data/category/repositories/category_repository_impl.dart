part of '../index.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      var result = await sl<CategoryFirebaseService>().getCategories();
      return Right(result);
    } on Exception catch (e) {
      return Left(FirebaseExceptionMapper.map(e));
    }
  }
}
