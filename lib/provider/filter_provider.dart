import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/meals.class.dart';
import 'package:meals_app/data/dummy.dart';



class MealsNotifier extends StateNotifier<List<Meal>> {
  MealsNotifier() : super([]);

List<Meal>? filterVeganMeals() {
    state = state.where((meal) => meal.isVegan).toList();
  }
}

final mealsProvider = StateNotifierProvider<MealsNotifier,List<Meal>>((ref) {
  return MealsNotifier();
});


class VegetarianNotifier extends StateNotifier<List<Meal>> {
  VegetarianNotifier() : super([]);

  List<Meal> ? filterVegMeals() {
    state = state.where((meal) => meal.isVegetarian).toList();

  }
}
final VegProvider = StateNotifierProvider<VegetarianNotifier,List<Meal>>((ref) {
  return  VegetarianNotifier();
});



