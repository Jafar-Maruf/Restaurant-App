part of '../index.dart';

class SignOutUseCase extends UseCase<String, void> {
  @override
  Future<Either<Failure, String>> call([void param]) async {
    return await sl<AuthRepository>().signOut();
  }
}
