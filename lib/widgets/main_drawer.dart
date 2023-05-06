import 'package:flutter/material.dart';
import '../screens/tabs_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Cooking Up!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "CondensedRoboto",
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
            alignment: Alignment.centerLeft,
          ),
          SizedBox(
            height: 8,
          ),
          ListTile(
            leading: Icon(Icons.food_bank),
            title: Text('Meals'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {

              Navigator.of(context).pushNamed('/filter_screen',);
            },
          ),
        ],
      ),
    );
  }
}
