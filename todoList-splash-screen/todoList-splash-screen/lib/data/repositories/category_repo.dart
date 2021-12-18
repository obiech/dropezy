// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:to_do_list_pro_project/data/data_source/category_data.dart';
import 'package:to_do_list_pro_project/data/models/category_model.dart';

class CategoryRepo {
  CategoryData categoryData;

  CategoryRepo(this.categoryData);

  List<CategoryModel> getCategories() {
    return categoryData.categoryList;
  }

  void addCategory(CategoryModel category) {
    categoryData.addCategory(category);
  }

  void removeCategory(CategoryModel category) {
    categoryData.removeCategory(category);
  }

}
