import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/models/category_model.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();

  //1
  categoryModel.categoryName = "Business";
  categoryModel.imageUrl = "https://images.unsplash.com/39/lIZrwvbeRuuzqOoWJUEn_Photoaday_CSD%20(1%20of%201)-5.jpg?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8YnVzaW5lc3N8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=60";
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  //2
  categoryModel.categoryName = "Science";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1581093588401-fbb62a02f120?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NXx8c2NpZW5jZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=60";
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  //3
  categoryModel.categoryName = "Politics";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1529107386315-e1a2ed48a620?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8cG9saXRpY3N8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=60";
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  //4
  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1517649763962-0c623066013b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8c3BvcnRzfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=60";
  category.add(categoryModel);

  return category;
}