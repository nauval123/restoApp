import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_app/data/model/LocalRestaurant.dart';

class DetailRestaurant extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final restaurantInfo = ModalRoute.of(context)!.settings.arguments as LocalRestaurant;

    return Scaffold(
        body: 
        SafeArea(
            child:  
            NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) 
              {  
                return [
                  SliverAppBar(
                    leading: Container(),
                    backgroundColor: Colors.orange[900],
                    elevation: 0,
                    pinned: true,
                    expandedHeight: 250,
                    flexibleSpace:  FlexibleSpaceBar(
                      background: Hero(
                        tag: restaurantInfo, 
                        child: Image.network(
                          restaurantInfo.pictureId,
                          fit: BoxFit.cover,
                          errorBuilder:(BuildContext context, Object exception, StackTrace? stackTrace) {
                            return AlertDialog(
                              title: Text("Error"),
                              content: Container(child: Text("Gambar gagal Dapat Dmuat!"),) ,
                              actions: [
                                TextButton(onPressed: (){ Navigator.pop(context);}, child:Text("OK"))
                              ],
                            );
                          },
                          ),
                        ),
                      title: Text(restaurantInfo.name, style: Theme.of(context).textTheme.headline6,),
                      titlePadding: EdgeInsets.only(left: 15 , bottom: 15),
                    ),
                  ),
                ];
              }, 
              body: SingleChildScrollView(
                  child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                           color: Colors.black54,
                         ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                        Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Expanded(
                             flex: 5,
                             child: Container(
                               color: Colors.transparent,
                               child: Row(
                                 children: [
                                   Icon(Icons.location_city_outlined,size: 25,color: Colors.white,),
                                   Container(width: 10,),
                                  Text(restaurantInfo.city,textAlign: TextAlign.start,style: Theme.of(context).textTheme.subtitle1,),
                               ],),
                             )
                            ),
                           Expanded(
                             child: Icon(Icons.star,color: Colors.yellow,size: 35,)),
                           Expanded(
                             child: Text(restaurantInfo.rating),),
                         ],
                        ),
                        Divider(
                          color: Colors.white38,
                          thickness: 1,
                        ),
                        Container(
                          margin:EdgeInsets.only(left:5 ,bottom:10 ,right:5 ,top:20 ,) ,
                          child: Text(restaurantInfo.description,style: Theme.of(context).textTheme.subtitle2),
                        ),               
                        Divider(
                          color: Colors.white38,
                          thickness: 1,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left:5 ,bottom:10 ,right:5 ,top:20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Foods",textAlign: TextAlign.start,style: Theme.of(context).textTheme.headline6),
                              Container(
                          height: MediaQuery.of(context).size.height/10,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: restaurantInfo.menus.food.length,
                            itemBuilder: (BuildContext context , index){
                              return Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.only(top: 15,bottom: 10,right: 10,left: 10),
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Colors.orange[800],
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                child: Center(child: Wrap(spacing: 10,children: [Icon(Icons.food_bank,color: Colors.white,),Text(restaurantInfo.menus.food[index].name , maxLines: 2,style: TextStyle(fontSize: 15),),],)),
                              );
                            }
                          ),  
                        ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text("Drinks",style: Theme.of(context).textTheme.headline6),
                            Container(
                          height: MediaQuery.of(context).size.height/10,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(5),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: restaurantInfo.menus.drink.length,
                            itemBuilder: (BuildContext context , index){
                              return Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.only(top: 15,bottom: 10,right: 10,left: 10),
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Colors.orange[800],
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                child: Center(child: Wrap(spacing: 10, children: [Icon(Icons.local_drink,color: Colors.white,),Text(restaurantInfo.menus.drink[index].name , maxLines: 2,style: TextStyle(fontSize: 15),),],)),
                              );
                            }
                          ),  
                        ),
                          ],),
                        ),
                   ],
                 ),
                ),
                )
              )
          )
    );
  }
}
