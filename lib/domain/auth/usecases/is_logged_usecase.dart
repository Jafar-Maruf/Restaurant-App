part of '../index.dart';

class IsLoggedInUseCase extends UseCase<bool, void> {
  @override
  Future<Either<Failure, bool>> call([void param]) async {
    return await sl<AuthRepository>().isLogged();
  }
}
