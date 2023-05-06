import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
          padding: const EdgeInsets.all(25),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20),
          children: DUMMY_CATEGORIES.map((catData) {
            return CategoryItem(
              title: catData.title,
              color: catData.color,
              id: catData.id,
            );
          }).toList()),
    );
  }
}
