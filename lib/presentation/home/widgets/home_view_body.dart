part of '../index.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: const HomeHeader()),
        SliverToBoxAdapter(
          child: FilteredSection(
            titleSection: 'Your Favourite',
            foodsList: controller.favouriteFoods,
          ),
        ),

        SliverToBoxAdapter(
          child: FilteredSection(
            titleSection: 'Popular',
            foodsList: controller.popularFoods,
          ),
        ),

        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              'Restaurant Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SliverPersistentHeader(
          pinned: false,
          delegate: MenuTabsDelegate(),
        ),

        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: .70,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: controller.foodsByCategoryName.length,
              (context, index) => Obx(() {
                if (controller.isLoadingFoodByCategory.value) {
                  return Center(child: CircularProgressIndicator());
                }
                return FoodCard(
                  imageAsset: controller
                      .foodsByCategoryName[index]
                      .images
                      .first
                      .imageUrl,
                  title: controller.foodsByCategoryName[index].food.title,
                  price: controller.foodsByCategoryName[index].food.price,
                  onAddPressed: () {},
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
