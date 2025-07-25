part of '../../index.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({super.key});

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  final List<Widget> _pages = [HomeView(), ProfileView()];
  static const List<NavBarItem> _items = [
    NavBarItem(assetName: AppImages.imageHome, label: 'Home'),
    NavBarItem(assetName: AppImages.imagesProfile, label: 'Profile'),
  ];
  final PageController pageController = PageController();
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
          pageController.jumpToPage(index);
        },
        children: _pages,
      ),

      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          pageController.animateToPage(
            index,
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 600),
          );
        },
        items: _items,
      ),
    );
  }
}
