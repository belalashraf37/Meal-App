import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routename = '/Filters';
  final Function saveFilter ;
 // final Map<String , bool> curtfilter;
  FiltersScreen(this.saveFilter);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  Widget buildSwitchlisttitle(String titile, String Descrption ,bool CurrentVal, Function updateval){
    return SwitchListTile(
      title:Text(titile) ,
      subtitle: Text(Descrption) ,
      value: CurrentVal,
      onChanged:updateval,
    );
  }

  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;

 /* @override
  void initState() {
     _GlutenFree = widget.curtfilter['gluten'];
     _LactoseFree = widget.curtfilter['Lactose'];
     _Vegan = widget.curtfilter['Vegan'];
     _Vegetarian = widget.curtfilter['Vegetarian'];
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon:Icon(Icons.save), onPressed:(){
            final Map<String , bool> selectedFilter = {
              'Gluten' : _GlutenFree,
              'Lactose' : _LactoseFree,
              'Vegan' : _Vegan,
              'Vegetarian' : _Vegetarian,
            };
            widget.saveFilter(selectedFilter);
          }),
        ],
        title: Text("Your Filter"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust Your Meal Selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchlisttitle("Gluten-Free", "Only Include Gluten Free Meal",  _GlutenFree, (newvalue){
                  setState(() {
                    _GlutenFree = newvalue  ;
                  });
                },),

                buildSwitchlisttitle("Lactose-Free", "Only Include Lactose Free Meal",  _LactoseFree, (newvalue){
                  setState(() {
                    _LactoseFree = newvalue  ;
                  });
                },),
                buildSwitchlisttitle("Vegan ", "Only Include Vegan Meal",  _Vegan, (newvalue){
                  setState(() {
                    _Vegan = newvalue  ;
                  });
                },),

                buildSwitchlisttitle("Vegetarian ", "Only Include Vegetarian Meal",  _Vegetarian, (newvalue){
                  setState(() {
                    _Vegetarian = newvalue  ;
                  });
                },),


              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
