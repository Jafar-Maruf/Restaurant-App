part of '../index.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  List<FoodEntity> favouriteItems = [
    FoodEntity(
      imageUrls: [AppImages.imagesPngwingBig],
      title: 'Supreme Pizza',
      price: '\$16',
    ),
    FoodEntity(
      imageUrls: [AppImages.imagesPngwingSmall],
      title: 'French fries',
      price: '\$16',
    ),

    FoodEntity(
      imageUrls: [AppImages.imagesPngwingBig],
      title: 'Supreme Pizza',
      price: '\$16',
    ),
    FoodEntity(
      imageUrls: [AppImages.imagesPngwingSmall],
      title: 'French fries',
      price: '\$16',
    ),
    FoodEntity(
      imageUrls: [AppImages.imagesPngwingBig],
      title: 'Supreme Pizza',
      price: '\$16',
    ),
    FoodEntity(
      imageUrls: [AppImages.imagesPngwingSmall],
      title: 'French fries',
      price: '\$16',
    ),
    FoodEntity(
      imageUrls: [AppImages.imagesPngwingBig],
      title: 'Supreme Pizza',
      price: '\$16',
    ),
    FoodEntity(
      imageUrls: [AppImages.imagesPngwingSmall],
      title: 'French fries',
      price: '\$16',
    ),
  ];

  List<FoodEntity> popularItems = [
    FoodEntity(
      imageUrls: [AppImages.imagesPngwingBig],
      title: 'Special Beef burger',
      price: '\$16',
    ),
    FoodEntity(imageUrls: ['assets/pasta.png'], title: 'Pasta', price: '\$16'),
  ];

  List<FoodEntity> menuItems = [
    FoodEntity(
      imageUrls: [AppImages.imagesPngwingBig],
      title: 'Supreme Pizza',
      price: '\$16',
    ),
    FoodEntity(
      imageUrls: [AppImages.imagesPngwingBig],
      title: 'Pepperoni Pizza',
      price: '\$16',
    ),
    FoodEntity(
      imageUrls: [AppImages.imagesPngwingBig],
      title: 'Pepperoni Pizza',
      price: '\$16',
    ),
    FoodEntity(
      imageUrls: [AppImages.imagesPngwingBig],
      title: 'Supreme Pizza',
      price: '\$16',
    ),
    FoodEntity(
      imageUrls: [AppImages.imagesPngwingBig],
      title: 'Margherita Pizza',
      price: '\$14',
    ),
    FoodEntity(
      imageUrls: [AppImages.imagesPngwingBig],
      title: 'Veggie Pizza',
      price: '\$15',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: const HomeHeader()),
        SliverToBoxAdapter(
          child: FilteredSection(
            titleSection: 'Your Favourite',
            foodsList: favouriteItems,
          ),
        ),
        SliverToBoxAdapter(
          child: FilteredSection(
            titleSection: 'Popular',
            foodsList: favouriteItems,
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
            delegate: SliverChildBuilderDelegate(childCount: menuItems.length, (
              context,
              index,
            ) {
              final item = menuItems[index];
              return FoodCard(
                imageAsset: item.imageUrls.first,
                title: item.title,
                price: item.price,
                onAddPressed: () {},
              );
            }),
          ),
        ),
      ],
    );
  }
}
