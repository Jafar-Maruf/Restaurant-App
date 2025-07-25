part of '../index.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _headerMenuImage(AppImages.imagesHeaderMenu),
          SizedBox(width: 16),
          _searchField(),
        ],
      ),
    );
  }

  Widget _headerMenuImage(String image) {
    return Container(
      width: 45,
      height: 45,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.container,
      ),
      child: SvgPicture.asset(image, width: 24, height: 24),
    );
  }

  Widget _searchField() {
    return Expanded(
      child: TextField(
        readOnly: true,
        onTap: () {},
        decoration: InputDecoration(
          fillColor: AppColors.container,
          contentPadding: const EdgeInsets.all(12),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.container),
            borderRadius: BorderRadius.circular(50),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.container),
            borderRadius: BorderRadius.circular(50),
          ),
          hintText: 'Search Foods, Categories',
          prefixIcon: SvgPicture.asset(
            AppImages.imagesSearch,
            fit: BoxFit.none,
          ),
          suffixIcon: SvgPicture.asset(
            AppImages.imagesSlider,
            width: 40,
            height: 40,
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
