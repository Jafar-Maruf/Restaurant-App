part of '../index.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> offsetAnimation;

  @override
  void onInit() async {
    slidingAnimation();
    Future.delayed(Duration(seconds: 2), () async {
      await isLogged();
    });
    super.onInit();
  }

  void slidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    offsetAnimation =
        Tween<Offset>(
            begin: const Offset(0, 2),
            end: const Offset(0, 1),
          ).chain(CurveTween(curve: Curves.easeIn)).animate(animationController)
          ..addListener(() {
            update();
          });

    animationController.forward();
  }

  Future<void> isLogged() async {
    var result = await sl<IsLoggedInUseCase>().call();
    result.fold(
      (notLogged) {
        Get.offNamed(AppPages.signIn);
      },
      (logged) {
        Get.offNamed(AppPages.home);
      },
    );
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
