part of '../index.dart';

class ViewOrderButton extends StatelessWidget {
  const ViewOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      width: double.infinity,
      height: 56,
      child: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: AppColors.secondary,
        foregroundColor: Colors.white,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        icon: SvgPicture.asset(
          AppImages.imagesShoppingCart,
          fit: BoxFit.scaleDown,
        ),
        label: Text(
          'See Your Order',
          style: AppStyles.styleSemiBold16(
            context,
          ).copyWith(color: AppColors.primary),
        ),
      ),
    );
  }
}
