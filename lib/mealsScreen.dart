//
//
// import 'package:flutter/material.dart';
// import 'package:meals_app/categories.dart';
// import 'package:meals_app/row_widget.dart';
// import 'package:meals_app/mealsDetailScreen.dart';
// import 'package:transparent_image/transparent_image.dart';
//
// import 'model/category.class.dart';
// import 'model/meals.class.dart';
// import 'package:meals_app/row_widget.dart';
// class MealsScreen extends StatelessWidget {
//   MealsScreen(this.mealList,this.category,{super.key});
//   final List<Meal> mealList;
//   final Category? category;
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(onPressed: (){
//             mealList.clear();
//          Navigator.pop(context);
//           }, icon: Icon(Icons.arrow_back)),
//
//         ],
//
//
//         title: Text(category!.title),
//
//
//
//
//         automaticallyImplyLeading: false,
//       ),
//       body:
//
//
//       ListView.builder(itemCount : mealList.length, itemBuilder: (BuildContext context, int index){
//         var complex= {
//           mealList[index].complexity.name[0].toUpperCase()+ mealList[index].complexity.name.substring(1)
//         };
//         return InkWell(
//           borderRadius: BorderRadius.circular(10),
//           onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) =>Details(mealList[index].title, mealList[index].imageUrl, mealList[index])));} ,
//           child: Card(
//             margin: EdgeInsets.all(18),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//             clipBehavior: Clip.hardEdge,
//             elevation: 2,
//             child: Stack(
//               children: [
//                 FadeInImage(placeholder:  MemoryImage(kTransparentImage), image:NetworkImage(mealList[index].imageUrl)
//                   ,fit: BoxFit.cover,),
//                 Positioned(
//                   right: 0,
//                   left: 0,
//                   bottom: 0,
//                   child:
//                   Container(
//
//                       color: Colors.black54,
//                       child: Column(
//                         children: [
//
//
//                           Text(mealList[index].title, maxLines: 2, textAlign: TextAlign.center,softWrap: true, overflow: TextOverflow.ellipsis,
//                             style: TextStyle(fontWeight: FontWeight.bold,
//                                 fontSize: 20,
//                                 color: Colors.white),),
//
//                           SizedBox(height: 20,),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//
//                               ReusableRow(Icons.timelapse_sharp, mealList[index].duration.toString()),
//                               SizedBox(width: 20,),
//                               ReusableRow(Icons.work,complex.toString()),
//                               SizedBox(width: 20,),
//                               ReusableRow(Icons.money,mealList[index].affordability.name ),
//                             ],
//                           )
//                         ],
//                       )
//
//
//
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//
//   }
// }
import 'package:flutter/material.dart';
import 'package:meals_app/categories.dart';
import 'package:meals_app/row_widget.dart';
import 'package:meals_app/mealsDetailScreen.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals_app/data/dummy.dart';
import 'model/category.class.dart';
import 'model/meals.class.dart';


class MealsScreen extends StatelessWidget {
  MealsScreen(this.mealList, this.category, {Key? key}) : super(key: key);
  final List<Meal> mealList;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        mealList.clear();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(category.title),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                mealList.clear();
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: mealList.length,
          itemBuilder: (BuildContext context, int index) {
            var complex = {
              mealList[index].complexity.name[0].toUpperCase() +
                  mealList[index].complexity.name.substring(1)
            };
            return InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(
                      mealList[index]
                    ),
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.all(18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                clipBehavior: Clip.hardEdge,
                elevation: 2,
                child: Stack(
                  children: [
                   Hero(tag: mealList[index].id, child:  FadeInImage(
                     placeholder: MemoryImage(kTransparentImage),
                     image: NetworkImage(mealList[index].imageUrl),
                     fit: BoxFit.cover,
                   ),),
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Container(
                        color: Colors.black54,
                        child: Column(
                          children: [
                            Text(
                              mealList[index].title,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ReusableRow(
                                  Icons.timelapse_sharp,
                                  mealList[index].duration.toString(),
                                ),
                                SizedBox(width: 20),
                                ReusableRow(
                                  Icons.work,
                                  complex.toString(),
                                ),
                                SizedBox(width: 20),
                                ReusableRow(
                                  Icons.money,
                                  mealList[index].affordability.name,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

