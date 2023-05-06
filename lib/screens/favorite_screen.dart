import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/meal.dart';
import '../widgets/meals_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals =
      DUMMY_MEALS.where((meal) => meal.isFavorite == true).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) {
          return MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability);
        },
      ),
    );
  }
}
