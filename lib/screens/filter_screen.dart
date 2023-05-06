import 'package:flutter/material.dart';
import 'package:meal_recipy_app/screens/tabs_screen.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function filterFunction;
  final Map<String, bool> filters;

  FilterScreen(this.filters, this.filterFunction);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _gluttenFree = false;
  bool _lactoseFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;

  @override
  void initState() {

    _gluttenFree = widget.filters["glutten-free"]!;
    _lactoseFree = widget.filters["lactose-free"]!;
    _isVegetarian= widget.filters["vegetarian"]!;
    _isVegan = widget.filters["vegan"]!;

    // TODO: implement initState
    super.initState();
  }

  Widget _getListTile(bool currentValue, void Function(bool)? updatedValue,
      String title, String description) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updatedValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {

    final Map<String, bool> _filters = {
      "glutten-free": _gluttenFree,
      "lactose-free": _lactoseFree,
      "vegetarian": _isVegetarian,
      "vegan": _isVegan
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.filterFunction(_filters);
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Raleway",
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _getListTile(_gluttenFree, (clicked) {
                  setState(() {
                    _gluttenFree = clicked;
                  });
                }, 'Glutten-free', 'only include glutten-free meals'),
                _getListTile(_lactoseFree, (clicked) {
                  setState(() {
                    _lactoseFree = clicked;
                  });
                }, 'Lactose-free', 'only include lactose-free meals'),
                _getListTile(_isVegetarian, (clicked) {
                  setState(() {
                    _isVegetarian = clicked;
                  });
                }, 'Vegetarian', 'only include vegetarian meals'),
                _getListTile(_isVegan, (clicked) {
                  setState(() {
                    _isVegan = clicked;
                  });
                }, 'Vegan', 'only include vegan meals'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
