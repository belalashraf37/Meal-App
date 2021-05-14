import 'package:flutter/material.dart';
import '../modules/meal.dart';
import '../widgets/mealitem.dart';


class CategoryMealsScreen extends StatefulWidget {
  static const routename = 'Category_Meals';
  final List<Meal> availablemeals;
  CategoryMealsScreen(this.availablemeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
 String categorytitle;
 List<Meal> displaymeals;

 @override
  void didChangeDependencies() {
   final routarg = ModalRoute.of(context).settings.arguments as Map<String , String>;
   final categoryid = routarg['id'];
   categorytitle = routarg['title'];
   displaymeals = widget.availablemeals.where((meal) {
     return meal.categories.contains(categoryid);
   }).toList();
    super.didChangeDependencies();
  }

  void _removemeal(String mealid){
   setState(() {
     displaymeals.removeWhere((meal) => meal.id == mealid);
   });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title:Text(categorytitle) ,
      ),
      body: ListView.builder(
          itemBuilder: (ctx , index){
             return MealItem(
               id:displaymeals[index].id ,
               imageUrl: displaymeals[index].imageUrl,
               title: displaymeals[index].title,
               duration: displaymeals[index].duration,
               complexity: displaymeals[index].complexity,
               affordability: displaymeals[index].affordability,

             );
          },
          itemCount:displaymeals.length ,
      ),
    );
  }
}
