// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:to_do_list_pro_project/data/models/category_model.dart';
import 'package:to_do_list_pro_project/theme/color_theme.dart';

class CategoryData {
  final List<CategoryModel> _categories = [
  ];

  List<CategoryModel> get categoryList => _categories;

  void addCategory(CategoryModel category) {
    _categories.add(category);
  }

  void removeCategory(CategoryModel category) {
    _categories.remove(category);
  }

}
