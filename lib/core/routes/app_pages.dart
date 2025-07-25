part of '../index.dart';

class AppPages {
  static const splash = '/splash';
  static const signIn = '/signin';
  static const signUp = '/signup';
  static const home = '/';

  static final routes = [
    GetPage(
      name: splash,
      curve: Curves.easeInOut,
      transition: Transition.fadeIn,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: signIn,
      curve: Curves.easeInOut,
      transition: Transition.fadeIn,
      page: () => SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: signUp,
      curve: Curves.easeInOut,
      transition: Transition.fadeIn,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: home,
      curve: Curves.easeInOut,
      transition: Transition.fadeIn,
      page: () => AppBottomNavBar(),
      bindings: [HomeBinding(), ProfileBinding()],
    ),
  ];
}
