import 'package:carousel_pro/carousel_pro.dart';
import 'package:fashion_shop/Widgets/recent_order.dart';
import 'package:fashion_shop/Widgets/startRating.dart';
import 'package:fashion_shop/components/Products.dart';
import 'package:fashion_shop/components/horizontal_listview.dart';
import 'package:fashion_shop/data/data.dart';
import 'package:fashion_shop/pages/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'cart.dart';
import 'cart.dart';

class HomeTopTabs extends StatefulWidget {



  _HomeTopTabsState createState() => _HomeTopTabsState();
}

class _HomeTopTabsState extends State<HomeTopTabs> with SingleTickerProviderStateMixin{
  Widget image_carousel;

  @override

  @override
  Widget build(BuildContext context) {

     image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage(
              'images/c1.jpg'
              ),
          AssetImage(
              'images/m1.jpeg'
              ),
          AssetImage(
              'images/w3.jpeg'
              ),
          AssetImage(
              'images/w4.jpeg'
              ),
          AssetImage(
              'images/m2.jpg'
              ),

        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(
            milliseconds: 1000
            ),
        dotSize: 4.0,
        indicatorBgPadding: 8.0,
        dotColor: Colors.white,

        ),

      );
     return Scaffold(

      body: ListView(
       physics: BouncingScrollPhysics(),

       children: <Widget>[
         //           image_carousel begin here
         image_carousel,
         //Padding Widget
         Padding(padding: const EdgeInsets.all(8.0),
                   child: new Text('category'),

                 ),
         //horizontal listview
         HorizontalList(),


       Column(
       crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
       Padding(
       padding: EdgeInsets.only(left: 10, top: 5, bottom: 10),
       child: Text(
         "Nearby Restaurants",
         style: TextStyle(
             color: Theme.of(context).primaryColor,
             fontWeight: FontWeight.w800,
             fontSize: 18,
             letterSpacing: 1.2),
         ),
       ),
    ...shops.map( (restaurant) {
    return GestureDetector(
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (_) => ShopScreen(
    restaurant: restaurant,
    ),
    ),
    );
    },
    child: Container(
    margin: EdgeInsets.only(left: 10, bottom: 20, right: 10),
    decoration: BoxDecoration(
    color: Colors.white,
    boxShadow: [
    BoxShadow(
    blurRadius: 3,
    color: Colors.grey,
    )
    ],
    borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
    children: <Widget>[
    ClipRRect(
    child: Hero(
    tag: restaurant.imageUrl,
    child: Image(
    image: AssetImage("${restaurant.imageUrl}"),
    fit: BoxFit.cover,
    height: 130,
    width: 150,
    ),
    ),
    borderRadius: BorderRadius.circular(20),
    ),
    SizedBox(
    width: 20,
    ),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Text(
    restaurant.name,
    style: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    ),
    ),
    SizedBox(height: 6),
    StartRating(restaurant.rating),
    SizedBox(height: 6),
    Text(
    restaurant.address,
    style: TextStyle(
    fontSize: 16,
    ),
    ),
    ],
    ),
    ],
    ),
    ),
    );
    }),
    ],
    ),

// ********************santos*******************
//         Padding(padding: const EdgeInsets.all(20.0),
//                   child: new Text('Recent products'),
//
//                 ),
//         //GridView
//         Container(
//           height: 320.0,
//           child: Products(),
//           ),
       ],
       ),
//    floatingActionButton: FloatingActionButton(
//    child: Icon(
//    Icons.shopping_cart,
//    color: Colors.white,
//    size: 30,
//    ),
//    onPressed: () => Navigator.push(
//    context,
//    MaterialPageRoute(
//    builder: (_) => Cart(),
//    ),
//    ),
//    ),
    );

  }

}