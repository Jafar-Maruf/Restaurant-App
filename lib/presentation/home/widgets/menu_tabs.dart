part of '../index.dart';

class MenuTabs extends StatefulWidget {
  const MenuTabs({super.key});

  @override
  State<MenuTabs> createState() => _MenuTabsState();
}

class _MenuTabsState extends State<MenuTabs> {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Obx(() {
      return SizedBox(
        height: 35,
        child: Skeletonizer(
          enabled: controller.isLoadingCategory.value,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              final isSelected = controller.selectedTabIndex.value == index;

              return GestureDetector(
                onTap: () => controller.changeCategoryTab(index: index),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 700),
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : AppColors.secondary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    controller.categories[index].title,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
