import 'package:flutter/material.dart';
import '../modules/meal.dart';
import '../widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'favoirte_screen.dart';
class TabsScreen extends StatefulWidget {
  final List<Meal>favroitemeals;

 TabsScreen(this.favroitemeals);


  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

   List<Map<String,Object>> _pages ;
  int _selectpageIndex = 0;
  @override
  void initState() {
    _pages = [
      {
        'page' : CategoriesScreen(),
        'title' : 'Categories',
      },
      {
        'page' : FavoriteScreen(widget.favroitemeals),
        'title' : 'Your Favorites',
      },
    ];
    super.initState();
  }

  void _selectedpage(int value) {
    setState(() {
      _selectpageIndex = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(_pages[_selectpageIndex]['title']),
      ),
      body: _pages[_selectpageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedpage,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectpageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category) ,
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star) ,
            label: "Favorite",
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }


}
