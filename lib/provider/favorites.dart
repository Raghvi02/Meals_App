import 'package:riverpod/riverpod.dart';
import 'package:meals_app/model/meals.class.dart';
import 'package:flutter/material.dart';
final FavoritesProvider = StateNotifierProvider<favorite,List<Meal>>((ref) {
  return favorite();
});

class favorite extends StateNotifier<List<Meal>> {
 favorite(): super([]);

  List<Meal>  addOrRemovefav(Meal meal){
    final mealIsFav = state.contains(meal);


     if(mealIsFav){
       state = state.where((m) => m.id!= meal.id).toList();


     }else{
       state = [...state, meal];

     }
     return state;

  }

}