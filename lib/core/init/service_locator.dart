part of '../index.dart';

final sl = GetIt.instance;

Future<void> initializeDependency() async {
  //-------------------sources------------------------------------//
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<CategoryFirebaseService>(CategoryFirebaseServiceImpl());
  sl.registerSingleton<FoodFirebaseService>(FoodFirebaseServiceImpl());

  //-------------------repositories-----------------------------------//
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());
  sl.registerSingleton<FoodRepository>(FoodRepositoryImpl());
  //-------------------usecases------------------------------------//
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<SignOutUseCase>(SignOutUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());

  sl.registerSingleton<GetAllCategories>(GetAllCategories());
  sl.registerSingleton<GetFavouriteFood>(GetFavouriteFood());
  sl.registerSingleton<GetPopularFood>(GetPopularFood());
  sl.registerSingleton<GetFoodByCategoryName>(GetFoodByCategoryName());
}
