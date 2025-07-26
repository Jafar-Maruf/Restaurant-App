part of '../index.dart';

class HomeController extends GetxController {
  var categories = <CategoryEntity>[].obs;
  var favouriteFoods = <FoodWithImagesEntity>[].obs;
  var popularFoods = <FoodWithImagesEntity>[].obs;
  var foodsByCategoryName = <FoodWithImagesEntity>[].obs;

  var isLoadingCategory = false.obs;
  var isLoadingFavourite = false.obs;
  var isLoadingPopular = false.obs;
  var isLoadingFoodByCategory = false.obs;

  final RxInt selectedTabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
    getFavouriteFoods();
    getPopularFoods();
    getFoodByCategoryName();
  }

  void changeCategoryTab({required int index}) async {
    if (selectedTabIndex.value == index) return;

    selectedTabIndex.value = index;
    final selectedCategory = categories[index];
    await getFoodByCategoryName(categoryName: selectedCategory.title);
  }

  Future<void> getAllCategories() async {
    isLoadingCategory.value = true;
    var result = await sl<GetAllCategories>().call();

    result.fold(
      (failure) {
        AppSnackBar.show(title: 'Error', message: failure.message);
        isLoadingCategory.value = false;
      },
      (categoriesData) {
        categories.value = categoriesData;
        isLoadingCategory.value = false;
      },
    );
  }

  Future<void> getFavouriteFoods() async {
    isLoadingFavourite.value = true;
    var result = await sl<GetFavouriteFood>().call();
    result.fold(
      (failure) {
        AppSnackBar.show(title: 'Error', message: failure.message);
        isLoadingFavourite.value = false;
      },
      (favouriteFoodsData) {
        favouriteFoods.value = favouriteFoodsData;
        isLoadingFavourite.value = false;
      },
    );
  }

  Future<void> getPopularFoods() async {
    isLoadingPopular.value = true;

    var result = await sl<GetPopularFood>().call();
    result.fold(
      (failure) {
        AppSnackBar.show(title: 'Error', message: failure.message);
        isLoadingPopular.value = false;
      },
      (popularFoodData) {
        popularFoods.value = popularFoodData;
        isLoadingPopular.value = false;
      },
    );
  }

  Future<void> getFoodByCategoryName({String categoryName = 'Burger'}) async {
    isLoadingFoodByCategory.value = true;

    var result = await sl<GetFoodByCategoryName>().call(categoryName);
    result.fold(
      (failure) {
        AppSnackBar.show(title: 'Error', message: failure.message);
        isLoadingFoodByCategory.value = false;
      },
      (foodByCategoryData) {
        foodsByCategoryName.value = foodByCategoryData;
        isLoadingFoodByCategory.value = false;
      },
    );
  }
}
