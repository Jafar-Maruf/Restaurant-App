part of '../index.dart';

class StoreUserRequest {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  const StoreUserRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
}
