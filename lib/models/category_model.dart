// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel(
      {required this.name, required this.iconPath, required this.boxColor});

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
        name: 'Flight',
        iconPath: 'assets/icons/flight.png',
        boxColor: Color(0xff92A3FD)));

    categories.add(CategoryModel(
        name: 'Train',
        iconPath: 'assets/icons/rain.png',
        boxColor: Color(0xffC58BF2)));

    categories.add(CategoryModel(
        name: 'Bus',
        iconPath: 'assets/icons/bus.png',
        boxColor: Color(0xff92A3FD)));
    return categories;
  }
}
