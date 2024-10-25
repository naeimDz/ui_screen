import 'package:flutter/material.dart';
import 'package:flutter_starter_template/model/category.dart';

class CategoryProvider with ChangeNotifier {
  final List<Category> _categories = [
    Category(name: 'All', isSelected: true),
    Category(name: 'Technology'),
    Category(name: 'Business'),
    Category(name: 'Science'),
    Category(name: 'Sports'),
    Category(name: 'Health'),
    // Add more categories as needed
  ];

  List<Category> get categories => _categories;

  void selectCategory(int index) {
    for (int i = 0; i < _categories.length; i++) {
      _categories[i].isSelected =
          i == index; // Only the selected category is active
    }
    notifyListeners();
  }

  String getSelectedCategory() {
    return _categories.firstWhere((category) => category.isSelected).name;
  }
}
