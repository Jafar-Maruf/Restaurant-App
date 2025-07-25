part of '../index.dart';

abstract class AppStyles {
  static TextStyle styleMedium12(BuildContext context) {
    return const TextStyle(fontSize: 12, fontWeight: FontWeight.w500);
  }

  static TextStyle styleBold18(BuildContext context) {
    return const TextStyle(fontSize: 18, fontWeight: FontWeight.w700);
  }

  static TextStyle styleRegular16(BuildContext context) {
    return const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  }

  static TextStyle styleBold16(BuildContext context) {
    return const TextStyle(fontSize: 16, fontWeight: FontWeight.w700);
  }

  static TextStyle styleBold32(BuildContext context) {
    return const TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
  }
}
