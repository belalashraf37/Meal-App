import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routename = 'Meal_Detail';
  final Function togglefavroite;
  final Function ismealfavroite;
  MealDetailScreen(this.togglefavroite , this.ismealfavroite);

  Widget buildTitle( BuildContext context ,String text  ){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme
          .of(context)
          .textTheme
          .title,),
    );
  }
  Widget buildcontainer(Widget child ){
    return  Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child ,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute
        .of(context)
        .settings
        .arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
            ),
           buildTitle( context , "Ingedients"),
           buildcontainer( ListView.builder(
             itemBuilder: (ctx , index) => Card(
               color: Theme.of(context).accentColor,
               child: Padding(
                 padding: const EdgeInsets.symmetric(vertical: 5 , horizontal: 10),
                 child: Text(selectedMeal.ingredients[index]),
               ),
             ),
             itemCount:selectedMeal.ingredients.length,
           ),),
            buildTitle( context , "Steps"),
            buildcontainer( ListView.builder(
              itemBuilder: (ctx , index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5 , horizontal: 10),
                  child: Text(selectedMeal.steps[index]),
                ),
              ),
              itemCount:selectedMeal.steps.length,
            ),),


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=> togglefavroite(mealid) ,
        child: Icon(
            ismealfavroite(mealid) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
