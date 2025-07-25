part of '../index.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> signUp(StoreUserRequest userRequest);

  Future<Either<Failure, UserEntity>> signIn(LoginUserRequest userRequest);

  Future<Either<Failure, String>> signOut();

  Future<Either<Failure, bool>> isLogged();
}
