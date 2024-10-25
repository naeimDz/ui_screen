import 'package:flutter/material.dart';
import 'package:flutter_starter_template/providers/category_provider.dart';
import 'package:provider/provider.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final categories = categoryProvider.categories;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 50, // Fixed height for category filter bar
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () {
                categoryProvider.selectCategory(index);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: category.isSelected ? Colors.cyan : Colors.grey[200],
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: category.isSelected
                      ? const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          )
                        ]
                      : [],
                ),
                alignment: Alignment.center,
                child: Text(
                  category.name,
                  style: TextStyle(
                    color: category.isSelected ? Colors.white : Colors.black54,
                    fontWeight: category.isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
