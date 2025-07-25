part of '../index.dart';

class ProfileController extends GetxController {
  Future<void> signOut() async {
    var result = await sl<SignOutUseCase>().call();
    result.fold(
      (error) {
        AppSnackBar.show(
          title: 'Error',
          message: error.message,
          backgroundColor: AppColors.secondary,
          textColor: AppColors.primary,
          iconColor: AppColors.primary,
        );
      },
      (data) {
        AppSnackBar.show(
          title: 'Success',
          message: data,
          backgroundColor: AppColors.primary,
        );
        Get.offAllNamed(AppPages.signIn);
      },
    );
  }
}
