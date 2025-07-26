part of '../index.dart';

abstract class CategoryFirebaseService {
  Future<List<CategoryEntity>> getCategories();
}

class CategoryFirebaseServiceImpl extends CategoryFirebaseService {
  @override
  Future<List<CategoryEntity>> getCategories() async {
    var data = await FirebaseFirestore.instance.collection("categories").get();

    List<CategoryEntity> categories = data.docs
        .map((category) => CategoryModel.fromJson(category.data()).toEntity())
        .toList();

    return categories;
  }
}
