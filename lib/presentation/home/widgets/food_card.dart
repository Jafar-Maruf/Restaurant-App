part of '../index.dart';

class FoodCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String price;
  final VoidCallback onAddPressed;

  const FoodCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.price,
    required this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.container,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 3, child: _imageSection()),
          Expanded(flex: 2, child: _detailsFoodSection(context)),
        ],
      ),
    );
  }

  Widget _imageSection() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        shape: BoxShape.circle,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        child: Image.asset(
          imageAsset,
          fit: BoxFit.scaleDown,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: const Color(0xFF3A3A3A),
              child: const Icon(Icons.fastfood, color: Colors.grey, size: 40),
            );
          },
        ),
      ),
    );
  }

  Widget _detailsFoodSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(price, style: AppStyles.styleBold16(context)),
              GestureDetector(
                onTap: onAddPressed,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: AppColors.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    AppImages.imagesAddIcon,
                    width: 24,
                    height: 24,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
