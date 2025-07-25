part of '../index.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Name and Edit Button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Gilbert Jones', style: AppStyles.styleSemiBold20(context)),
            Text(
              'Edit',
              style: AppStyles.styleMedium16(
                context,
              ).copyWith(color: AppColors.primary),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Email
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Gilbertjones001@gmail.com',
            style: AppStyles.styleRegular14(
              context,
            ).copyWith(color: AppColors.hintText),
          ),
        ),

        const SizedBox(height: 4),

        // Phone Number
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '121-224-7890',
            style: AppStyles.styleRegular14(
              context,
            ).copyWith(color: AppColors.hintText),
          ),
        ),
      ],
    );
  }
}
