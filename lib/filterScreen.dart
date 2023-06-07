import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:meals_app/model/meals.class.dart';
import 'package:meals_app/provider/filter_provider.dart';
class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {


  @override

  bool isVegetarian = false;
  bool isVegan = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [IconButton(onPressed: (){
          Navigator.pop(context);
        }
            , icon: Icon(Icons.back_hand))],
        automaticallyImplyLeading: false,
      ),

body:
 Column(
   children: [

     Row(
       children: [
         Text('Vegan', style: TextStyle(
           fontSize: 30,
         ),),
    Expanded(child:  SwitchListTile(value: isVegetarian, onChanged: (isOn){
      ref.watch(VegProvider.notifier).filterVegMeals();
    }))



       ],
     ),
     Row(
       children: [
         Text('Vegetarian', style: TextStyle(
           fontSize: 30,
         ),),
         Expanded(child:  SwitchListTile(value: isVegan, onChanged: (isOn){
          ref.watch(VegProvider.notifier).filterVegMeals();

         }))



       ],
     ),
   ],
 )

    );
  }
}

