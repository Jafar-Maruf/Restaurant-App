part of '../index.dart';

class CategoryModel {
  final String categoryId;
  final String title;

  const CategoryModel({required this.categoryId, required this.title});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['category_id'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'title': title,
    };
  }
}

extension CategoryXModel on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      title: title,
    );
  }
}
