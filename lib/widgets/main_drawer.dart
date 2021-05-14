import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';
class MainDrawer extends StatelessWidget {
  Widget buildListtitle(String title , IconData icon , Function x){
    return  ListTile(
      leading: Icon(icon , size: 26),
      title: Text(title , style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,fontFamily: 'RobotoCondensed'),),
      onTap: x,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
     child: Column(
       children: [
         Container(
           color: Theme.of(context).accentColor,
           height: 120,
           width: double.infinity,
           padding: EdgeInsets.all(20),
           alignment: Alignment.centerLeft,
           child: Text('Cooking Up!' , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.w900, color:Theme.of(context).primaryColor),),
         ),
         SizedBox(height:20),
         buildListtitle("Meal", Icons.restaurant ,(){Navigator.of(context).pushReplacementNamed('/');} ),
         buildListtitle("Filters", Icons.settings,(){Navigator.of(context).pushReplacementNamed(FiltersScreen.routename);}),


       ],
     ),
    );
  }
}
