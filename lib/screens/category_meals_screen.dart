import 'package:flutter/material.dart';
import '../widgets/meals_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {

 final List<Meal> availableMeals;

 CategoryMealsScreen(this.availableMeals);

  @override
  Widget build(BuildContext context) {

    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String categoryTitle = args['title'].toString();
    final String categoryID = args['id'].toString();

    final List<Meal> categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(categoryID);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability);
        },
      ),
    );
  }
}
