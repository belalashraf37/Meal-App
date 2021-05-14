import 'package:flutter/material.dart';
import '../widgets/mealitem.dart';
import '../modules/meal.dart';
class FavoriteScreen extends StatelessWidget {
  final List<Meal>favroitemeals;

  FavoriteScreen(this.favroitemeals);

  @override
  Widget build(BuildContext context) {

    if(favroitemeals.isEmpty){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(" You Have No Favorites Yet - Start Adding Some! "),
        ),
      );
    }
    else {
     return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favroitemeals[index].id,
            imageUrl: favroitemeals[index].imageUrl,
            title: favroitemeals[index].title,
            duration: favroitemeals[index].duration,
            complexity: favroitemeals[index].complexity,
            affordability: favroitemeals[index].affordability,
          );
        },
        itemCount: favroitemeals.length,
      );

  }
  }
  }





