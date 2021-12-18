// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:to_do_list_pro_project/data/models/category_model.dart';
import 'package:to_do_list_pro_project/data/repositories/category_repo.dart';
import 'package:to_do_list_pro_project/database/squlite.dart';
import 'package:to_do_list_pro_project/utils/global_state.dart' as global;
import 'package:to_do_list_pro_project/utils/helper.dart';

// import 'package:to_do_list_pro_project/screens/main_screen/widgets/database/squlite.dart';

part 'category_list_event.dart';
part 'category_list_state.dart';

class CategoryListBloc extends Bloc<CategoryListEvent, CategoryListState> {
  CategoryListBloc(this.categoryRepo) : super(CategoryListInitial());

  CategoryRepo categoryRepo;
  Helper helper = Helper();

  DbHelper db = DbHelper();

  @override
  Stream<CategoryListState> mapEventToState(
    CategoryListEvent event,
  ) async* {
    if (event is CategoryListInitialEvent) {
      yield CategoryListInitial();
      helper.getCat();
    }
    if (event is CategoryListLoadEvent) {
      yield CategoryListLoading();
      try {
        yield CategoryListLoaded(
          categories: await db.getDocsCategory(),
        );
        helper.getCat();
      } catch (e) {
        e.toString();
        yield CategoryListError();
      }
    }
    if (event is AddCategoryEvent) {
      yield CategoryListLoading();
      try {
        // categoryRepo.addCategory(event.category);
        db.insertDoc(name: 'category', model: event.category);
        yield CategoryListLoaded(
          categories: await db.getDocsCategory(),
        );
        helper.getCat();
      } catch (e) {
        e.toString();
        yield CategoryListError();
      }
    }
    if (event is RemoveCategoryEvent) {
      yield CategoryListLoading();
      try {
        db.deleteDoc(id: event.category.id!, name: 'category');

        yield CategoryListLoaded(
          categories: await db.getDocsCategory(),
        );
        helper.getCat();
      } catch (e) {
        e.toString();
        yield CategoryListError();
      }
    }
    if (event is EditCategoryEvent) {
      yield CategoryListLoading();
      try {
        await db.updateDoc(model: event.category, name: 'category');
        yield CategoryListLoaded(
          categories: await db.getDocsCategory(),
        );
        helper.getCat();
      } catch (e) {
        e.toString();
        yield CategoryListError();
      }
    }
  }
}
