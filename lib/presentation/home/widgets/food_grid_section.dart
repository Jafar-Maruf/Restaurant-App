part of '../index.dart';

class FoodGridSection extends StatelessWidget {
  const FoodGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(() {
      return Skeletonizer(
        enabled: controller.isLoadingFoodByCategory.value,
        child: controller.foodsByCategoryName.isEmpty
            ? Center(
                child: SizedBox(
                  height: 100,
                  child: Text(
                    'There is no found foods now',
                    style: AppStyles.styleMedium16(
                      context,
                    ).copyWith(color: AppColors.hintText),
                  ),
                ),
              )
            : SizedBox(
                height: MediaQuery.sizeOf(context).height * .3,
                child: GridView.builder(
                  itemCount: controller.foodsByCategoryName.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: .70,
                  ),
                  itemBuilder: (context, index) {
                    final foodItem = controller.foodsByCategoryName[index];
                    return FoodCard(
                      imageAsset: foodItem.images.first.imageUrl,
                      title: foodItem.food.title,
                      price: foodItem.food.price,
                      onAddPressed: () {},
                    );
                  },
                ),
              ),
      );
    });
  }
}
