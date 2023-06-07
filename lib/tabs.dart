import 'package:flutter/material.dart';

import 'package:meals_app/categories.dart';
import 'package:meals_app/favorites.dart';
import 'package:meals_app/provider/filter_provider.dart';
import 'package:meals_app/filterScreen.dart';
class tabBar extends StatefulWidget {
  const tabBar({Key? key}) : super(key: key);

  @override
  State<tabBar> createState() => _tabBarState();
}

class _tabBarState extends State<tabBar> {
  int _selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {

    Widget activePage =  CategoryScreen();

    if (_selectedPageIndex == 1) {
      activePage = Fav()  ;

    }

    if (_selectedPageIndex == 2) {
      activePage = FilterScreen()  ;

    }
    return Scaffold(


 body: activePage,
      bottomNavigationBar: BottomNavigationBar(
      //
        onTap: (index){
          setState(() {
            _selectedPageIndex = index;
          });
        },
        currentIndex: _selectedPageIndex,


        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter),
            label: 'Filters',
          ),
        ],
      ),





















      // drawer: Drawer(
      //   child: Column(
      //     children: [
      //       DrawerHeader(
      //
      //           child: Row(
      //             children: [
      //               Icon(Icons.fastfood),
      //               SizedBox(width: 50,),
      //               Text('Cooking up!'),
      //             ],
      //           )
      //       ),
      //       ListTile(
      //         title: Text('Meals'),
      //         leading: Icon(Icons.restaurant),
      //         onTap: () {
      //           Navigator.push(context, MaterialPageRoute(
      //               builder: (context) => MealsScreen(dummyMeals)));
      //         }),
      //
      //       ListTile(
      //         title: Text('Filter'),
      //         leading: Icon(Icons.settings),
      //         onTap: (){Navigator.push(context, MaterialPageRoute(
      //             builder: (context) => Fav()));} ,
      //       ),
      //     ],
      //   ),
      //
      // ),
    );
  }
}
