import 'package:flutter/material.dart';
import 'package:meals_app/categoryGridItem.dart';
import 'package:meals_app/data/dummy.dart';

import 'model/meals.class.dart';
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    super.initState();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _animationController, builder: (context,child)=>  Scaffold(

        appBar: AppBar(
          title: Text('Choose your category',
            style: Theme.of(context).textTheme.bodyLarge,),

        ),
        body: Padding(
          padding: EdgeInsets.only(top: 100.0 - _animationController.value * 100.0),
          child:  GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: [
              ...availableCategories.map((category) => CategoryGridItem(category)).toList()
            ],
          ),
        )

    ));
  }
}
