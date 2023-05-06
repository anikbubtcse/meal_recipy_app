import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/category_screen.dart';
import '../screens/favorite_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _initialItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_initialItem == 0 ? 'Category' : 'Favourite'),
      ),
      drawer: MainDrawer(),
      body: _initialItem == 0
          ? CategoriesScreen()
          : FavoriteScreen(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _initialItem,
        onTap: (index) {
          setState(() {
            _initialItem = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
              color: Colors.white,
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              label: 'Favourite'),
        ],
      ),
    );
  }
}
