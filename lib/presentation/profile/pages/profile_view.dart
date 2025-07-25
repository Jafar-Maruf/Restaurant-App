part of '../index.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Center(child: Text("profile")),
        Spacer(),
        BasicAppButton(
          width: MediaQuery.sizeOf(context).width - 40,
          onPressed: () {
            var controller = Get.put(ProfileController());
            controller.signOut();
          },
          title: "Sign Out",
        ),
      ],
    );
  }
}
