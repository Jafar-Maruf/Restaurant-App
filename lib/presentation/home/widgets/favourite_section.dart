part of '../index.dart';

class FavouriteSection extends StatelessWidget {
  const FavouriteSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(() {
      return Skeletonizer(
        enabled: controller.isLoadingPopular.value,
        child: FilteredSection(
          titleSection: 'Your Favourite',
          foodsList: controller.favouriteFoods,
        ),
      );
    });
  }
}
