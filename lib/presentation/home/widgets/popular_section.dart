part of '../index.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(() {
      return Skeletonizer(
        enabled: controller.isLoadingPopular.value,
        child: FilteredSection(
          titleSection: 'Popular',
          foodsList: controller.popularFoods,
        ),
      );
    });
  }
}
