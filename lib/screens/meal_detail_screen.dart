import 'package:flutter/material.dart';
import '../dummy_data.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatefulWidget {
  final String mealId;

  MealDetailScreen(this.mealId);

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  late Meal meal;

  void _setFavorite() {
    if (meal.isFavorite == false) {
      setState(() {
        meal.isFavorite = true;
      });
    } else if (meal.isFavorite == true) {
      setState(() {
        meal.isFavorite = false;
      });
    }
  }

  Widget buildSectionTitle(String text) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    meal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == widget.mealId;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('${meal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle("Ingredients"),
            Container(
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(meal.ingredients[index]),
                      ),
                    );
                  }),
            ),
            buildSectionTitle("Steps"),
            Container(
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: meal.steps.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${index + 1}'),
                          ),
                          title: Text(meal.steps[index]),
                        ),
                        Divider(
                          color: Colors.black54,
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _setFavorite,
        child: Icon(
          meal.isFavorite == false ? Icons.star_border : Icons.star,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
