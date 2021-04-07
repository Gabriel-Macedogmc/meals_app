import 'package:flutter/material.dart';
import 'package:meals_app/components/category_item.dart';
import 'package:meals_app/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: DUMMY_CATEGORIES.map((cat) {
            return CategoryItem(cat);
          }).toList()),
    );
  }
}
