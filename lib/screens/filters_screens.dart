import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;

  @override
  void initState() {
    _GlutenFree = widget.currentFilters['gluten'];
    _LactoseFree = widget.currentFilters['lactose'];
    _Vegan = widget.currentFilters['vegan'];
    _Vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Filters"), actions: [
        IconButton(
            onPressed: () {
              final Map<String, bool> selectedFilters = {
                'gluten': _GlutenFree,
                'lactose': _LactoseFree,
                'vegan': _Vegan,
                'vegetarian': _Vegetarian,
              };

              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save)),
      ]),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              "Adjust Your meal selection",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'RobotoCondensed',
                  fontStyle: FontStyle.italic),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  'Gluten-Free',
                  "Only include Gluten-Free meals.",
                  _GlutenFree,
                  (newValue) {
                    setState(() {
                      _GlutenFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Lactose-Free',
                  "Only include Lactose-Free meals.",
                  _LactoseFree,
                  (newValue) {
                    setState(() {
                      _LactoseFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegetarian',
                  "Only include Vegetarian meals.",
                  _Vegetarian,
                  (newValue) {
                    setState(() {
                      _Vegetarian = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegan',
                  "Only include Vegan meals.",
                  _Vegan,
                  (newValue) {
                    setState(() {
                      _Vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
      drawer: const MainDrawer(),
    );
  }
}
