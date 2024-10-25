import 'package:flutter/material.dart';
import 'package:flutter_starter_template/providers/category_provider.dart';
import 'package:provider/provider.dart';

class FilteredContent extends StatelessWidget {
  const FilteredContent({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedCategory =
        Provider.of<CategoryProvider>(context).getSelectedCategory();

    // Dummy data for filtered items
    final List<String> allItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

    // Simple logic to filter by category (could be more complex depending on your app)
    final filteredItems = allItems.where((item) {
      return selectedCategory == 'All' || item.contains(selectedCategory);
    }).toList();

    return ListView.builder(
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredItems[index]),
        );
      },
    );
  }
}
