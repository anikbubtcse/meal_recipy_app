import 'package:flutter/material.dart';
import 'package:meal_recipy_app/screens/favorite_screen.dart';
import './screens/filter_screen.dart';
import './screens/tabs_screen.dart';
import './Screens/category_meals_screen.dart';
import './dummy_data.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "glutten-free": false,
    "lactose-free": false,
    "vegetarian": false,
    "vegan": false
  };

  List<Meal> _filteredMeal = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterResults) {
    setState(() {
      _filters = filterResults;

      _filteredMeal = DUMMY_MEALS.where((meal) {
        if (_filters["glutten-free"]! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters["lactose-free"]! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters["vegetarian"]! && !meal.isVegan) {
          return false;
        }
        if (_filters["vegan"]! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
        fontFamily: "Raleway",
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        '/filter_screen': (context) => FilterScreen(_filters, _setFilters),
        '/category_meals_screen': (context) =>
            CategoryMealsScreen(_filteredMeal),
      },
    );
  }
}
