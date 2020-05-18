//import './models/categories.dart';
import './dummy_data.dart';
import './models/details.dart';

import './screens/filters_screen.dart';

import './screens/tabs_screen.dart';

import './screens/detail_info_screen.dart';
import './screens/category_item_screen.dart';
import 'package:flutter/material.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian':false,
  };

  List<Details> _availableDetails=DUMMY_Details;

  void _setFilters(Map<String,bool> filterData){
    setState(() {
      _filters=filterData;
      _availableDetails=DUMMY_Details.where((detail){
        
        if(_filters['gluten']&&!detail.isGlutenFree){
          return false;
        }
        if(_filters['lactose']&&!detail.isLactoseFree){
          return false;
        }
        if(_filters['vegan']&&!detail.isVegan){
          return false;
        }
        if(_filters['vegetarian']&&!detail.isVegetarian){
          return false;
        }
        return true;
      } ).toList();
    });
  }
 
  

 
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //home: Categories(),
      initialRoute: '/',
      routes: {
        '/':(ctx)=>TabScreen(),
        FilterScreen.routeName: (ctx)=>FilterScreen(_filters,_setFilters),
        DetailInfoScreen.routeName: (ctx) => DetailInfoScreen(),
        CategoryItemScreen.routeName: (ctx) => CategoryItemScreen(_availableDetails),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => Categories(),
        );
      },
    );
  }
}
