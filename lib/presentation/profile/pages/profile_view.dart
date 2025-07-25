part of '../index.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: const ProfileHeader(),
            ),
          ),

          // Menu Options
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 20),
              ProfileMenuItem(
                title: 'Address',
                onTap: () => _handleMenuTap(context, 'Address'),
              ),
              ProfileMenuItem(
                title: 'Wishlist',
                onTap: () => _handleMenuTap(context, 'Wishlist'),
              ),
              ProfileMenuItem(
                title: 'Payment',
                onTap: () => _handleMenuTap(context, 'Payment'),
              ),
              ProfileMenuItem(
                title: 'Help',
                onTap: () => _handleMenuTap(context, 'Help'),
              ),
              ProfileMenuItem(
                title: 'Support',
                onTap: () => _handleMenuTap(context, 'Support'),
              ),
              const SizedBox(height: 40),
            ]),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BasicAppButton(
                onPressed: () => _handleSignOut(context),
                title: 'Sign Out',
                textColor: AppColors.primary,
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleMenuTap(BuildContext context, String menuItem) {
    AppSnackBar.show(title: '$menuItem tapped', message: '');
  }

  void _handleSignOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.secondary,
          title: const Text('Sign Out', style: TextStyle(color: Colors.white)),
          content: const Text(
            'Are you sure you want to sign out?',
            style: TextStyle(color: Colors.grey),
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () {
                var controller = Get.put(ProfileController());
                controller.signOut();
              },
              child: const Text(
                'Sign Out',
                style: TextStyle(color: AppColors.primary),
              ),
            ),
          ],
        );
      },
    );
  }
}
