

import 'package:flutter/material.dart';
import 'package:meals_app/mealsScreen.dart';
import 'package:meals_app/model/category.class.dart';
import 'package:meals_app/model/meals.class.dart';
import 'package:meals_app/data/dummy.dart';
import 'model/category.class.dart';
class CategoryGridItem extends StatelessWidget {
  CategoryGridItem(this.category, {super.key});
  final Category category;

  @override
  final List<Meal> mealList=[];

  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      splashColor: Theme.of(context).primaryColor,
      onTap: (){
          for( int j=0; j<dummyMeals.length; j++) {
            for (int k = 0; k < dummyMeals[j].categories.length; k++) {
              if (category.id == dummyMeals[j].categories[k]){
                mealList.add(dummyMeals[j]);

            }
          }
        }
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MealsScreen(mealList, category)));

      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
            category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),

            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(category.title),
      ),
    );
  }
}
