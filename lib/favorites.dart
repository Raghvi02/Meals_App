import 'package:flutter/material.dart';
import 'package:meals_app/provider/favorites.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/meals.class.dart';
import 'package:meals_app/mealsDetailScreen.dart';
import 'package:meals_app/row_widget.dart';
class Fav extends ConsumerWidget {
  const Fav({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context,WidgetRef ref) {
    List<Meal> favMealList= ref.watch(FavoritesProvider);

    return Scaffold(

      appBar: AppBar(
        title:  Text('Favorites'),
      ),
      body:
      ListView.builder(itemCount : favMealList.length, itemBuilder: (BuildContext context, int index){

        var complex= {
          favMealList[index].complexity.name[0].toUpperCase()+ favMealList[index].complexity.name.substring(1)
        };
        return InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) =>Details(favMealList[index])));} ,
          child: Card(
            margin: EdgeInsets.all(18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.hardEdge,
            elevation: 2,
            child: Text(favMealList[index].title),
        ),
        );
      }),
    );
  }
}
