import 'package:flutter/material.dart';
import './dummy_data.dart';
import './modules/meal.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String , bool> _filters = {
    'Gluten' : false,
    'Lactose' : false,
    'Vegan' : false,
    'Vegetarian' : false,


};

  List<Meal>_availablemeals = DUMMY_MEALS;
  List<Meal>_favroitemeals = [];

  void _setFilter( Map<String , bool> _filtersData){
  setState(() {
   _filters = _filtersData;
   _availablemeals = DUMMY_MEALS.where((meal) {
      if( _filters['Gluten'] && !meal.isGlutenFree){return false;}
      if( _filters['Lactose'] && !meal.isLactoseFree){return false;}
      if( _filters['Vegan'] && !meal.isVegan){return false;}
      if( _filters['Vegetarian'] && !meal.isVegetarian){return false;}
      return true;
   }).toList();
 });
  }
  void _togglefavroite(String mealid){
   final existingindex =  _favroitemeals.indexWhere((meal) => meal.id == mealid);
   if(existingindex >=0){
     setState(() {
       _favroitemeals.removeAt(existingindex);
     });
   }
   else{
     setState(() {
       _favroitemeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealid));
     });
   }
  }
  bool _ismealfavroite(String id){
    return _favroitemeals.any((meal) => meal.id == id);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: " Flutter Demo ",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 50, 50, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 50, 50, 1),
          ),
          title: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed',
          ),
        ),
      ),
     // home: MyHomePage(),
     // home: CategoriesScreen(),
      routes: {
        '/' : (ctx) => TabsScreen(_favroitemeals),
        CategoryMealsScreen.routename:(ctx)=> CategoryMealsScreen( _availablemeals),
        MealDetailScreen.routename:(ctx)=> MealDetailScreen( _togglefavroite , _ismealfavroite),
        FiltersScreen.routename:(ctx)=> FiltersScreen(_setFilter),
      },
    );
  }
}

class MyHomePage  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }

}

class _MyHomePageState  extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body: null,

    );


  }
}


