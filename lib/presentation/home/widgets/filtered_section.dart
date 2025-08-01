part of '../index.dart';

class FilteredSection extends StatelessWidget {
  final String titleSection;

  final List<FoodWithImagesEntity> foodsList;

  const FilteredSection({
    super.key,
    required this.titleSection,
    required this.foodsList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: titleSection, onTap: () {}),
          const SizedBox(height: 12),

          foodsList.isEmpty
              ? Center(
                  child: Text(
                    'There is no found foods now',
                    style: AppStyles.styleMedium16(
                      context,
                    ).copyWith(color: AppColors.hintText),
                  ),
                )
              : SizedBox(
                  height: MediaQuery.sizeOf(context).height * .28,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(right: 16),
                    itemCount: foodsList.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 180,
                        margin: (index == 0)
                            ? const EdgeInsets.only(left: 16)
                            : (index == foodsList.length - 1)
                            ? const EdgeInsets.only(right: 16)
                            : EdgeInsets.zero,
                        child: FoodCard(
                          imageAsset: foodsList[index].images.first.imageUrl,
                          title: foodsList[index].food.title,
                          price: foodsList[index].food.price,
                          onAddPressed: () {},
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
