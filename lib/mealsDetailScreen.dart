import 'package:flutter/material.dart';
import 'package:meals_app/main.dart';
import 'package:meals_app/model/meals.class.dart';
import 'package:meals_app/data/dummy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/favorites.dart';
class Details extends ConsumerStatefulWidget {
 const  Details(this.meal,{super.key});

  final Meal meal;
  @override
  ConsumerState<Details> createState() => _DetailsState();
}

class _DetailsState extends ConsumerState<Details> {
  @override
 Icon rg =Icon(Icons.star_border) ;

  var flag =0;
  Widget build(BuildContext context) {

    // List<Meal>  favList = ref.read(FavoritesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
          IconButton(onPressed:(){

                ref.watch(FavoritesProvider.notifier).addOrRemovefav(widget.meal);
                setState(() {
                  if(flag==0){

                    rg=Icon(Icons.star);
                    flag=1;
                  print ('star_border');
                  }
                  else{ rg =Icon(Icons.star_border);
                  flag=0;
                  print ('star');}
                });

            } ,

              icon: rg  )

      ],
      ),
      body: Column(
        children: [
          Hero(tag: widget.meal.id, child: Image(image: NetworkImage(widget.meal.imageUrl.toString()),
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,)),
        ],
      ),

    );
  }
}
