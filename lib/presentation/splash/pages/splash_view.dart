part of '../index.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController controller = Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: controller.animationController,
          builder: (context, child) => SlideTransition(
            position: controller.offsetAnimation!,
            child: Image.asset(
              AppImages.vectorsLogo,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );  }
}
