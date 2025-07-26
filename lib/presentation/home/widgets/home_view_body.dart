part of '../index.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: const HomeHeader()),

        SliverToBoxAdapter(child: FavouriteSection()),
        SliverToBoxAdapter(child: PopularSection()),

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

        SliverToBoxAdapter(child: FoodGridSection()),
      ],
    );
  }
}
